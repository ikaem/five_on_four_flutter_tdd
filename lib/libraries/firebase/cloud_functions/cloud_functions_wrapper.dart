import 'package:cloud_functions/cloud_functions.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/firebase_functions_constants.dart';

class FirebaseFunctionsWrapper {
  late final FirebaseFunctions _firebaseFunctions;

  void initialize() {
    _firebaseFunctions = FirebaseFunctions.instanceFor(
      region: FirebaseFunctionsConstants.regionEuropeWest3,
    );
  }

  Future<void> sendNotifications({
    required String functionName,
    // TODO this should be a single map
    // required List<Map<String, dynamic>> notificationsData,
    required Map<String, dynamic> notificationsData,
  }) async {
    final HttpsCallable callable =
        _firebaseFunctions.httpsCallable("sendMatchInvitationNotifications");

    // TODO test
    final HttpsCallableResult<Map<String, dynamic>> result =
        await callable.call<Map<String, dynamic>>({
      "invitations": [
        {
          "playerId": "cENcRb7sx0PxKDDFS8CV0hoEaLx1",
          "matchName": "test",
          "matchId": "s"
        }
      ]
    });
  }
}
