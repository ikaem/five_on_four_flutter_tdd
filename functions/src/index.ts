// import { onRequest } from 'firebase-functions/v2/https';
import { region } from 'firebase-functions';
// import * as logger from 'firebase-functions/logger';
import * as admin from 'firebase-admin';
// import { DocumentReference } from 'firebase-admin/firestore';
import { DecodedIdToken } from 'firebase-admin/auth';
import Joi = require('joi');
// import { runWith } from 'firebase-functions/v1';

interface Body {
  matchId: string;
  matchName: string;
  invitations: Invitation[];
}
interface Invitation {
  invitationId: string;
  userId: string;
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

const bodySchema: Joi.ObjectSchema<Body> = Joi.object({
  matchName: Joi.string().required(),
  matchId: Joi.string().required(),
  invitations: Joi.array<Invitation[]>()
    .items(
      Joi.object<Invitation>({
        invitationId: Joi.string().required(),
        userId: Joi.string().required(),
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

  const { invitations, matchId, matchName } = value;

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
  const email: string | undefined = decodedToken.email;
  const name: string | undefined = decodedToken.name;

  const matchInvitationNotificationFutures: Promise<MatchInvitationNotification | null>[] =
    invitations.map(async (invitation) => {
      const playerDocSnapshot = await collections.players
        .doc(invitation.userId)
        .get();
      const playerDocData = playerDocSnapshot.data();

      if (playerDocData === undefined) return null;

      const deviceToken = playerDocData.deviceToken;

      const invitationNotification: MatchInvitationNotification = {
        title: 'Match invitation',
        message: `${name} invited you to a match`,
        invitedBy: name ?? 'A fellow player',
        matchName,
        playerId: uid,
        matchId,
        deviceToken,
      };

      return invitationNotification;
    });

  const matchInvitationNotifications: (MatchInvitationNotification | null)[] =
    await Promise.all(matchInvitationNotificationFutures);
  const matchInvitationNotificationsFiltered: MatchInvitationNotification[] =
    matchInvitationNotifications.filter(
      (notification) => notification !== null
    ) as MatchInvitationNotification[];
  const matchInvitationNotificationsDeviceTokens: string[] =
    matchInvitationNotificationsFiltered.map(
      (notification) => notification.deviceToken
    );

  // const oneUserRef: DocumentReference<admin.firestore.DocumentData> =
  //   collections.players.doc('cENcRb7sx0PxKDDFS8CV0hoEaLx1');
  // const oneUserData: admin.firestore.DocumentSnapshot<admin.firestore.DocumentData> =
  //   await oneUserRef.get();

  // const userDeviceToken: string | null = oneUserData.get('deviceToken');
  // if (userDeviceToken === null) {
  //   response.status(404).send('No device token found for user');

  //   return;
  // }

  await admin.messaging().sendEachForMulticast({
    tokens: matchInvitationNotificationsDeviceTokens,
    data: {
      matchId,
      matchName,
      // TODO how to add user id to which message is meant for?
    },
    notification: {
      title: 'Hello beautiful',
      body: `${name} invited you to a match ${matchName}`,
    },
  });

  response.send(
    // 'Hello from Firebase! this is request token: ' + requestToken
    {
      data: {
        // userDeviceToken,
        // requestToken,
        authorization,
        uid,
        email,
      },
    }
  );
  // response.send(
  //   'Hello from Firebase! this is deviceToken: ' + userDeviceToken
  // );
});

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
