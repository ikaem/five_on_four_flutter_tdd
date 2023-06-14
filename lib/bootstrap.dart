import 'dart:async';
import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/app_dependencies_manager.dart';
import 'package:five_on_four_flutter_tdd/libraries/riverpod/riverpod_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // runApp(
  //   ProviderScope(
  //     child: appDependencies.overlaySupportWrapper.globalWrap(await builder()),
  //     overrides: RiverpodWrapper.getAppProvidersOverrides(appDependencies),
  //     observers: RiverpodWrapper.getProviderObservers(appDependencies),
  //   ),
  // );

  await runZonedGuarded(
    () async {
// FUTURE: this could be moved TO ZONEGUARDED
      await dotenv.load(fileName: ".env");
      WidgetsFlutterBinding.ensureInitialized();
      // final InitializedAppDependenciesValue appDependencies =
      //     await AppDependenciesManager.getInitializedDependencies();
      final InitializedAppDependenciesValue appDependencies =
          await AppDependenciesManager.getInitializedDependencies();

      FlutterError.onError = (details) {
        appDependencies.loggerWrapper.log(
          logLevel: Level.error,
          message: "FlutterError: ${details.exception}",
          stackTrace: details.stack ?? StackTrace.current,
        );
      };

      runApp(
        ProviderScope(
          child:
              appDependencies.overlaySupportWrapper.globalWrap(await builder()),
          overrides: RiverpodWrapper.getAppProvidersOverrides(appDependencies),
          observers: RiverpodWrapper.getProviderObservers(appDependencies),
        ),
      );
    },
    (error, stackTrace) {
      // appDependencies.loggerWrapper.log(
      //   logLevel: Level.error,
      //   message: "Unhandled error: $error",
      //   stackTrace: stackTrace,
      // );

      log(
        "Unhandled error: $error",
        level: 2000,
        // TODO maybe better to use logging package
        // logLevel: Level.error,
        stackTrace: stackTrace,
      );
    },
  );

  // await runZonedGuarded(
  //   () async {
  //     runApp(
  //       ProviderScope(
  //         child:
  //             appDependencies.overlaySupportWrapper.globalWrap(await builder()),
  //         overrides: RiverpodWrapper.getAppProvidersOverrides(appDependencies),
  //         observers: RiverpodWrapper.getProviderObservers(appDependencies),
  //       ),
  //     );
  //   },
  //   (error, stackTrace) {
  //     appDependencies.loggerWrapper.log(
  //       logLevel: Level.error,
  //       message: "Unhandled error: $error",
  //       stackTrace: stackTrace,
  //     );
  //   },
  // );
}
