import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';

mixin MatchesServiceMixin on MatchesService {
  Future<void> sendMatchInvitationNotifications({
    required String functionName,
    required List<MatchParticipationValue> matchInvitations,
    required String matchId,
    required String matchName,
    required FirebaseFunctionsWrapper firebaseFunctionsWrapper,
  }) async {
    final List<Map<String, dynamic>> invitationNotificationsData =
        matchInvitations.map((invitation) {
      final Map<String, dynamic> notificationData =
          invitation.toInvitationNotificationDataMap(
        matchId: matchId,
        matchName: matchName,
      );

      return notificationData;
    }).toList();

    await firebaseFunctionsWrapper.sendNotifications(
      functionName: functionName,
      notificationsData: invitationNotificationsData,
    );
  }
}
