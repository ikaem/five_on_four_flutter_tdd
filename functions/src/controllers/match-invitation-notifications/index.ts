import { Request, Response } from 'firebase-functions/v1';
import {
  firebaseAdminWrapper,
  Notification,
} from '../../libraries/firebase/firebase-admin/firebase-admin-wrapper';
import { joiWrapper } from '../../libraries/joi/joi-wrapper';
import { MatchInvitationNotification } from './types/types';
import { HttpMethod } from '../../utils/enums/http-method';

export const handleMatchInvitationNotifications = async (
  request: Request,
  response: Response
) => {
  // FUTURE abstract authetnication this if more functions added
  const { authorization } = request.headers;
  if (authorization === undefined) {
    response
      .status(404)
      .json({ data: { ok: false, message: 'No authorization header found' } });
    return;
  }

  const isAuthHeaderValidFormat: boolean = authorization.startsWith('Bearer ');
  if (!isAuthHeaderValidFormat) {
    response
      .status(404)
      .json({ data: { ok: false, message: 'No authorization header found' } });
    return;
  }

  const idToken: string = authorization.split('Bearer ')[1];

  const { value: decodedToken, error: authError } =
    await firebaseAdminWrapper.authenticateIdToken(idToken);
  if (authError !== undefined) {
    response.status(401).json({ data: { ok: false, message: 'Unauthorized' } });
    return;
  }

  const invitedbyName = decodedToken.name;

  const method: String = request.method;
  if (method !== HttpMethod.POST) {
    response
      .status(405)
      .json({ data: { message: 'Method not allowed', ok: false } });
    return;
  }

  const { error: validationError, value } = joiWrapper.validate(
    joiWrapper.sendMatchNotificationsBodySchema,
    request.body
  );

  if (validationError !== undefined) {
    response.status(400).json({ data: { message: 'Invalid body', ok: false } });
    return;
  }

  const {
    data: { invitations },
  } = value;
  if (invitations.length === 0) {
    response
      .status(400)
      .json({ data: { ok: false, message: 'No invitations submitted' } });
    return;
  }

  const { error: collectionsError, value: collectionsValue } =
    firebaseAdminWrapper.collections;
  if (collectionsError !== undefined) {
    response
      .status(500)
      .json({ data: { ok: false, message: 'App has not been initialized' } });
    return;
  }

  const { players: playersCollection } = collectionsValue;

  // getting data from firebase
  const matchInvitationNotificationFutures = invitations.map(
    async (invitation) => {
      const playerDocSnaphot = await playersCollection
        .doc(invitation.playerId)
        .get();
      const playerDocData = playerDocSnaphot.data();
      if (playerDocData === undefined) return null;

      const playerId = playerDocSnaphot.id;
      const playerName = playerDocData.name;

      const playerDeviceToken = playerDocData.deviceToken;
      if (playerDeviceToken === undefined) return null;

      const matchId = invitation.matchId;
      const matchName = invitation.matchName;
      const invitedBy = invitedbyName ?? 'A fellow player';

      const notificationTitle = 'Match invitation';
      const notificationMessage = `${playerName} invited you to a match`;

      const invitationNotification: MatchInvitationNotification = {
        title: notificationTitle,
        message: notificationMessage,
        invitedBy: invitedBy,
        matchName: matchName,
        playerId: playerId,
        matchId: matchId,
        deviceToken: playerDeviceToken,
      };

      return invitationNotification;
    }
  );

  try {
    const matchInvitationNotifications: (MatchInvitationNotification | null)[] =
      await Promise.all(matchInvitationNotificationFutures);

    const matchInvitationNotificationsFiltered: MatchInvitationNotification[] =
      matchInvitationNotifications.filter(
        (notification) => notification !== null
      ) as MatchInvitationNotification[];

    const matchInvitationFullMessages: Notification[] =
      matchInvitationNotificationsFiltered.map((notification) => {
        const message: Notification = {
          notification: {
            title: notification.title,
            body: notification.message,
          },
          data: {
            matchId: notification.matchId,
            matchName: notification.matchName,
            invitedBy: notification.invitedBy,
            playerId: notification.playerId,
          },
          token: notification.deviceToken,
        };

        return message;
      });

    await firebaseAdminWrapper.sendNotifications(matchInvitationFullMessages);

    response.status(200).json({ data: { ok: true } });
  } catch (error) {
    // FUTURE add logger
    response.status(500).json({
      data: {
        ok: false,
        message: `Something went wrong: ${error?.toString()}`,
      },
    });
  }
};
