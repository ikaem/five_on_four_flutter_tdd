import { handleMatchInvitationNotifications } from './controllers/match-invitation-notifications';
import { firebaseAdminWrapper } from './libraries/firebase/firebase-admin/firebase-admin-wrapper';
import { firebaseFunctionsWrapper } from './libraries/firebase/firebase-functions/firebase-functions-wrapper';

firebaseAdminWrapper.initialize();

export const sendMatchInvitationNotifications =
  firebaseFunctionsWrapper.callFunction(handleMatchInvitationNotifications);
