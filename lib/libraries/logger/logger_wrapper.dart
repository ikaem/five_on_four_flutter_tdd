import 'package:logger/logger.dart';

class LoggerWrapper {
  final Logger _logger = Logger();

  void log({
    required Level logLevel,
    required String message,
    dynamic error,
    required StackTrace stackTrace,
  }) {
    _logger.log(
      logLevel,
      message,
      error,
      stackTrace,
    );
  }
}
