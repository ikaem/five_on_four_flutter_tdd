import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/app_dependencies_manager.dart';
import 'package:five_on_four_flutter_tdd/libraries/riverpod/riverpod_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await dotenv.load(fileName: ".env");

// FUTURE: this could be moved TO ZONEGUARDED
  WidgetsFlutterBinding.ensureInitialized();
  final InitializedAppDependenciesValue appDependencies =
      await AppDependenciesManager.getInitializedDependencies();

  FlutterError.onError = (details) {
    appDependencies.loggerWrapper.log(
      logLevel: Level.error,
      message: "FlutterError: ${details.exception}",
      stackTrace: details.stack ?? StackTrace.current,
    );
  };

  await runZonedGuarded(
    () async {
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
      appDependencies.loggerWrapper.log(
        logLevel: Level.error,
        message: "Unhandled error: $error",
        stackTrace: stackTrace,
      );
    },
  );
}
