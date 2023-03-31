import 'package:five_on_four_flutter_tdd/core/application/services/initial_data/providers/service_provider.dart';
import 'package:five_on_four_flutter_tdd/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/core/presentation/state/controllers/initial_data/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateNotifierProvider<InitialDataController,
        AsyncValue<InitialDataValue>> initialDataControllerProvider =
    StateNotifierProvider.autoDispose<InitialDataController,
        AsyncValue<InitialDataValue>>((ref) {
  final InitialDataService initialDataService =
      ref.read(initialDataServiceProvider);

  final InitialDataController initialDataController = InitialDataController(
    initialDataService: initialDataService,
  );

  return initialDataController;
});
