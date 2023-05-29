import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

// TODO might need to keep this awake
@riverpod
OverlaySupportWrapper overlaySupportWrapper(OverlaySupportWrapperRef ref) {
  final OverlaySupportWrapper overlaySupportWrapper = OverlaySupportWrapper();

  return overlaySupportWrapper;
}
