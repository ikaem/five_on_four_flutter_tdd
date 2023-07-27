import 'package:five_on_four_flutter_tdd/routing/routemaster/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@Riverpod(keepAlive: true)
RouteMasterRouter routeMasterRouter(RouteMasterRouterRef ref) {
  // final AsyncValue<AuthModel?> authStatus =
  //     ref.watch(authStatusControllerImplProvider);
  // final AuthStatusNewAppController authContoller =
  //     ref.watch(authStatusNewAppControllerProvider);
// will need this to load data initially
//   final InitialDataAppController initialDataAppController =
//       ref.read(initialDataAppControllerProvider.notifier);

  final RouteMasterRouter router = RouteMasterRouter(
      // authStatus: authStatus,
      // onPopToHomeScreen: initialDataAppController.onLoadInitialData,
      );

  return router;
}
