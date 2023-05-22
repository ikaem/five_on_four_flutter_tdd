// import { onRequest } from 'firebase-functions/v2/https';
import { region } from 'firebase-functions';
import * as logger from 'firebase-functions/logger';
import * as admin from 'firebase-admin';
import { DocumentReference } from 'firebase-admin/firestore';
// import { runWith } from 'firebase-functions/v1';

const { collections } = initializeAdminApp();

// TODO this needs to be called notifications - so we send multiple
export const sendNotification = region('europe-west3').https.onRequest(
  async (request, response) => {
    // TODO how to authenticate the request?
    const { token: requestToken, title } = request.body;
    const oneUserRef: DocumentReference<admin.firestore.DocumentData> =
      collections.players.doc('cENcRb7sx0PxKDDFS8CV0hoEaLx1');

    const oneUserData: admin.firestore.DocumentSnapshot<admin.firestore.DocumentData> =
      await oneUserRef.get();

    const userDeviceToken: string | null = oneUserData.get('deviceToken');
    if (userDeviceToken === null) {
      response.status(404).send('No device token found for user');

      return;
    }

    logger.info('token', requestToken);
    logger.info('title', title);
    logger.info('body');

    await admin.messaging().sendEachForMulticast({
      tokens: [userDeviceToken],
      notification: {
        title: 'Hello beautiful',
      },
    });

    response.send(
      // 'Hello from Firebase! this is request token: ' + requestToken
      {
        data: {
          userDeviceToken,
          requestToken,
        },
      }
    );
    // response.send(
    //   'Hello from Firebase! this is deviceToken: ' + userDeviceToken
    // );
  }
);

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
