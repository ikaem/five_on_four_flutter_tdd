import 'dart:async';

import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:five_on_four_flutter_tdd/libraries/logger/providers/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    final LoggerWrapper logger =
        ProviderContainer().read(loggerWrapperProvider);
    logger.log(
      logLevel: Level.error,
      message: "FlutterError: ${details.exception}",
      stackTrace: details.stack ?? StackTrace.current,
    );
  };

  await runZonedGuarded(
    () async {
      runApp(
        ProviderScope(
          child: await builder(),
          observers: [AppRiverpodObserver()],
        ),
      );
    },
    (error, stackTrace) {
      final LoggerWrapper logger =
          ProviderContainer().read(loggerWrapperProvider);
      logger.log(
        logLevel: Level.error,
        message: "Unhandled error: $error",
        stackTrace: stackTrace,
      );
    },
  );
}

class AppRiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final LoggerWrapper logger =
        ProviderContainer().read(loggerWrapperProvider);

    logger.log(
      logLevel: Level.info,
      message: newValue.toString(),
      stackTrace: StackTrace.current,
    );
  }
}
