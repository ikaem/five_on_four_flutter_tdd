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
    required List<Map<String, dynamic>> notificationsData,
  }) async {
    final HttpsCallable callable =
        _firebaseFunctions.httpsCallable(functionName);

    await callable.call<Map<String, dynamic>>(notificationsData);
  }
}
