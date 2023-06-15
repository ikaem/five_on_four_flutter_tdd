import 'dart:async';
import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/app_dependencies_manager.dart';
import 'package:five_on_four_flutter_tdd/libraries/riverpod/riverpod_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      FlutterError.onError = (details) {
        _handleError("FlutterError: ${details.exception}",
            details.stack ?? StackTrace.current);
      };

      try {
        await dotenv.load(fileName: ".env");
        WidgetsFlutterBinding.ensureInitialized();
        final InitializedAppDependenciesValue appDependencies =
            await AppDependenciesManager.getInitializedDependencies();

        runApp(
          ProviderScope(
            child: appDependencies.overlaySupportWrapper
                .globalWrap(await builder()),
            overrides:
                RiverpodWrapper.getAppProvidersOverrides(appDependencies),
            observers: RiverpodWrapper.getProviderObservers(appDependencies),
          ),
        );
      } catch (e) {
        _handleError(e.toString(), StackTrace.current);
      }
    },
    (error, stackTrace) {
      _handleError(error.toString(), stackTrace);
    },
  );
}

void _handleError(String message, StackTrace stackTrace) {
  log(
    message,
    level: 2000,
    stackTrace: stackTrace,
  );
}
