export interface SendMatchNotificationsBody {
  invitations: Invitation[];
}
export interface Invitation {
  playerId: string;
  matchId: string;
  matchName: string;
}

// TODO not sure this is needed at all
export interface MatchInvitationNotification {
  title: string;
  message: string;
  matchId: string;
  matchName: string;
  invitedBy: string;
  playerId: string;
  deviceToken: string;
}
