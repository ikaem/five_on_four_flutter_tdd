import 'dart:async';

import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/firebase_core_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_core/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/firebase_messaging_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/firebase_messaging/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:five_on_four_flutter_tdd/libraries/logger/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/providers/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  final LoggerWrapper loggerWrapper = LoggerWrapper();
  final FirebaseCoreWrapper firebaseCoreWrapper = FirebaseCoreWrapper();
  final FirebaseMessagingWrapper firebaseMessagingWrapper =
      FirebaseMessagingWrapper();
  final OverlaySupportWrapper overlaySupportWrapper = OverlaySupportWrapper();

  // FUTURE check for better error handling if one of the initializers fails
  await firebaseCoreWrapper.initialize();
  await firebaseMessagingWrapper.initialize();

  FlutterError.onError = (details) {
    loggerWrapper.log(
      logLevel: Level.error,
      message: "FlutterError: ${details.exception}",
      stackTrace: details.stack ?? StackTrace.current,
    );
  };

  await runZonedGuarded(
    () async {
      runApp(
        ProviderScope(
          child: overlaySupportWrapper.globalWrap(await builder()),
          overrides: [
            loggerWrapperProvider.overrideWith((ref) => loggerWrapper),
            firebaseCoreWrapperProvider
                .overrideWith((ref) => firebaseCoreWrapper),
            overlaySupportWrapperProvider
                .overrideWith((ref) => overlaySupportWrapper),
            firebaseMessagingWrapperProvider
                .overrideWith((ref) => firebaseMessagingWrapper),
          ],
          observers: [
            AppRiverpodObserver(
              loggerWrapper: loggerWrapper,
            )
          ],
        ),
      );
    },
    (error, stackTrace) {
      loggerWrapper.log(
        logLevel: Level.error,
        message: "Unhandled error: $error",
        stackTrace: stackTrace,
      );
    },
  );
}

class AppRiverpodObserver extends ProviderObserver {
  AppRiverpodObserver({
    required this.loggerWrapper,
  });

  final LoggerWrapper loggerWrapper;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    loggerWrapper.log(
      logLevel: Level.info,
      message: newValue.toString(),
      stackTrace: StackTrace.current,
    );

    super.didUpdateProvider(
      provider,
      previousValue,
      newValue,
      container,
    );
  }
}
