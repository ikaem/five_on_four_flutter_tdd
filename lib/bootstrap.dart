import 'dart:async';
import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/app_dependencies_manager.dart';
import 'package:five_on_four_flutter_tdd/libraries/riverpod/riverpod_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:sentry_flutter/sentry_flutter.dart";

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    _handleError("FlutterError: ${details.exception}",
        details.stack ?? StackTrace.current);
  };

  await SentryFlutter.init(
    (options) {
      // TODO move this to env
      options.dsn =
          'https://564d0b9b7685475baf9e86e28ed1650d@o4505600123863040.ingest.sentry.io/4505600124846080';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
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
  );
}

void _handleError(String message, StackTrace stackTrace) {
  log(
    message,
    level: 2000,
    stackTrace: stackTrace,
  );
}
