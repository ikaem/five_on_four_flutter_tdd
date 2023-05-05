import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
LoggerWrapper loggerWrapper(LoggerWrapperRef ref) {
  final LoggerWrapper loggerWrapper = LoggerWrapper();

  return loggerWrapper;
}
