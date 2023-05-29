import { Message as Notification } from 'firebase-admin/lib/messaging/messaging-api';
import * as admin from 'firebase-admin';
import { DecodedIdToken } from 'firebase-admin/auth';
import { FirebaseConstants } from '../firebase-constants';

export { Notification };

type Collections = {
  players: FirebaseFirestore.CollectionReference;
};

// TODO move types eslewhere
type CollectionsResult =
  | {
      value: Collections;
      error: undefined;
    }
  | {
      value: undefined;
      error: true;
    };

type AuthenticationResult =
  | {
      value: DecodedIdToken;
      error: undefined;
    }
  | {
      value: undefined;
      error: true;
    };

class FirebaseAdminWrapper {
  private get db() {
    return admin.firestore();
  }
  private get firebaseMessaging() {
    return admin.messaging();
  }

  private get hasInitialized() {
    const hasInitialized = admin.apps.length > 0;
    return hasInitialized;
  }

  initialize() {
    if (this.hasInitialized) return;

    admin.initializeApp();
  }

  get collections(): CollectionsResult {
    const hasAppInitialized = this.hasInitialized;
    if (!hasAppInitialized) {
      return {
        value: undefined,
        error: true,
      };
    }

    return {
      value: {
        players: this.db.collection(FirebaseConstants.collectionPlayers),
      },
      error: undefined,
    };
  }

  async sendNotifications(notifications: Notification[]) {
    const hasAppInitialized = this.hasInitialized;
    if (!hasAppInitialized) {
      // FUTURE possibly need custom defined error here
      throw new Error('Firebase app not initialized');
    }

    await this.firebaseMessaging.sendEach(notifications);
  }

  async authenticateIdToken(token: string): Promise<AuthenticationResult> {
    try {
      const decodedToken = await admin.auth().verifyIdToken(token);
      return {
        value: decodedToken,
        error: undefined,
      };
    } catch (error) {
      return {
        value: undefined,
        error: true,
      };
    }
  }
}

export const firebaseAdminWrapper = new FirebaseAdminWrapper();
