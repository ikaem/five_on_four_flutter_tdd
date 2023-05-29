import { region } from 'firebase-functions/v1';
import { FirebaseConstants } from '../firebase-constants';

class FirebaseFunctionsWrapper {
  callFunction = region(FirebaseConstants.regionEuWest3).https.onRequest;
}

export const firebaseFunctionsWrapper = new FirebaseFunctionsWrapper();
