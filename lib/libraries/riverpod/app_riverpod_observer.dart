import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
