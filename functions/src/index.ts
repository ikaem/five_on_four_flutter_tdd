// import { onRequest } from 'firebase-functions/v2/https';
import { region } from 'firebase-functions';
// import * as logger from 'firebase-functions/logger';
import * as admin from 'firebase-admin';
// import { DocumentReference } from 'firebase-admin/firestore';
import { DecodedIdToken } from 'firebase-admin/auth';
import Joi = require('joi');
import { Message as FullMessage } from 'firebase-admin/lib/messaging/messaging-api';
// import { runWith } from 'firebase-functions/v1';

interface SendMatchNotificationsBody {
  invitations: Invitation[];
}
interface Invitation {
  // invitationId: string;
  playerId: string;
  matchId: string;
  matchName: string;
}

// interface for notification
interface MatchInvitationNotification {
  title: string;
  message: string;
  matchId: string;
  matchName: string;
  invitedBy: string;
  playerId: string;
  deviceToken: string;
}

const bodySchema: Joi.ObjectSchema<SendMatchNotificationsBody> = Joi.object({
  invitations: Joi.array<Invitation[]>()
    .items(
      Joi.object<Invitation>({
        // TODO we should probably have invitaiton id here, to make sure that this invitaiton exists - iut is tricky to get it in the client though, so maybe we can get it from exsting data on the backend side
        // invitationId: Joi.string().required(),
        playerId: Joi.string().required(),
        matchName: Joi.string().required(),
        matchId: Joi.string().required(),
      })
    )
    .required(),
});

// TODO est

const { collections } = initializeAdminApp();

// TODO this needs to be called notifications - so we send multiple
export const sendMatchInvitationNotifications = region(
  'europe-west3'
).https.onRequest(async (request, response) => {
  const method: String = request.method;

  if (method.toLowerCase() !== 'post') {
    response.status(404).send('Method not allowed');
    return;
  }

  const { error, value } = bodySchema.validate(request.body);
  if (error !== undefined) {
    response.status(400).send('Invalid body');
    return;
  }

  const { invitations } = value;
  if (invitations.length == 0) {
    response.status(400).send('No invitations submitted');
    return;
  }

  // const { invitations }: { invitations: Invitation[] } = request.body;
  const { authorization } = request.headers;

  if (authorization === undefined) {
    response.status(404).send('No authorization header found');
    return;
  }

  const isAuthHeaderValidFormat: boolean = authorization.startsWith('Bearer ');
  if (!isAuthHeaderValidFormat) {
    response.status(404).send('No authorization header found');
    return;
  }

  const idToken: string = authorization.split('Bearer ')[1];

  const decodedToken: DecodedIdToken = await admin
    .auth()
    .verifyIdToken(idToken);

  const uid: string = decodedToken.uid;
  // const email: string | undefined = decodedToken.email;
  const name: string | undefined = decodedToken.name;

  const matchInvitationNotificationFutures: Promise<MatchInvitationNotification | null>[] =
    invitations.map(async (invitation) => {
      const playerDocSnapshot = await collections.players
        .doc(invitation.playerId)
        .get();
      const playerDocData = playerDocSnapshot.data();

      if (playerDocData === undefined) return null;

      const deviceToken = playerDocData.deviceToken;

      const invitationNotification: MatchInvitationNotification = {
        title: 'Match invitation',
        message: `${name} invited you to a match`,
        invitedBy: name ?? 'A fellow player',
        matchName: invitation.matchName,
        playerId: playerDocSnapshot.id,
        matchId: invitation.matchId,
        deviceToken,
      };

      return invitationNotification;
    });

  try {
    const matchInvitationNotifications: (MatchInvitationNotification | null)[] =
      await Promise.all(matchInvitationNotificationFutures);

    const matchInvitationNotificationsFiltered: MatchInvitationNotification[] =
      matchInvitationNotifications.filter(
        (notification) => notification !== null
      ) as MatchInvitationNotification[];

    const matchInvitationFullMessages: FullMessage[] =
      matchInvitationNotificationsFiltered.map((notification) => {
        const message: FullMessage = {
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

    await admin.messaging().sendEach(matchInvitationFullMessages);
  } catch (error) {
    response.status(500).send(`Something went wrong: ${error?.toString()}`);
    return;
  }

  // await admin.messaging().send({notification: 3, condition })

  // await admin.messaging().sendEach();

  // const oneUserRef: DocumentReference<admin.firestore.DocumentData> =
  //   collections.players.doc('cENcRb7sx0PxKDDFS8CV0hoEaLx1');
  // const oneUserData: admin.firestore.DocumentSnapshot<admin.firestore.DocumentData> =
  //   await oneUserRef.get();

  // const userDeviceToken: string | null = oneUserData.get('deviceToken');
  // if (userDeviceToken === null) {
  //   response.status(404).send('No device token found for user');

  //   return;
  // }

  // TODO maybe this works
  // const messages = matchInvitationNotificationsFiltered.map((notification) => {
  //   const message: Message = {
  //     // token:
  //   }
  // });

  // await admin.messaging().sendEach();

  //   await admin.messaging().sendEachForMulticast({
  //     tokens: matchInvitationNotificationsDeviceTokens,
  //     data: {
  //       matchId,
  //       matchName,
  //       // TODO how to add user id to which message is meant for?
  //     },
  //     notification: {
  //       title: 'Hello beautiful',
  //       body: `${name} invited you to a match ${matchName}`,
  //     },
  //   });

  /*   response.send({
    data: {
      authorization,
      uid,
      email,
    },
  }); */

  // TODO not sure if this will work - it might need "data" field on the response object
  response.status(200).send('OK');
});
//   // response.send(
//   //   'Hello from Firebase! this is deviceToken: ' + userDeviceToken
//   // );
// });

// TODO move this to its own service

function initializeAdminApp() {
  admin.initializeApp();

  const db: admin.firestore.Firestore = admin.firestore();
  const messaging: admin.messaging.Messaging = admin.messaging();

  return {
    db,
    messaging,
    collections: {
      players: db.collection('players'),
    },
  };
}
