import 'package:cloud_functions/cloud_functions.dart';

class FirebaseFunctionsWrapper {
  late final FirebaseFunctions _firebaseFunctions;

  void initialize() {
    _firebaseFunctions = FirebaseFunctions.instanceFor(
      region: 'europe-west3',
    );
  }

  Future<void> sendNotifications({
    required String functionName,
    // TODO data that is passed to here should be converted to map by "toMap" function to notificationas and such
    // TODO list because we always send multiple notifications
    required List<Map<String, dynamic>> data,
  }) async {
    final HttpsCallable callable =
        _firebaseFunctions.httpsCallable(functionName);

// TODO i dont think i need results
    await callable.call<Map<String, dynamic>>(data);
  }
}
