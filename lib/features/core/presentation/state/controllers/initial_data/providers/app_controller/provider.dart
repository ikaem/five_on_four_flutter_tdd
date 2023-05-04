import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@Riverpod(keepAlive: true)
class InitialDataAppController extends _$InitialDataAppController
    implements InitialDataController {
  late final InitialDataService initialDataService =
      ref.read(initialDataServiceProvider);

  @override
  AsyncValue<InitialDataValue?> build() {
    return AsyncValue.loading();
  }

  Future<void> onLoadInitialData() async {
    try {
      final InitialDataValue initialData =
          await initialDataService.handleGetInitialData();

      state = AsyncValue.data(initialData);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
