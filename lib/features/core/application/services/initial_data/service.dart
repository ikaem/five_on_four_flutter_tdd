import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';

abstract class InitialDataService {
  Future<InitialDataValue> handleGetInitialData();
}
