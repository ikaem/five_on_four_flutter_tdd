import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class OverlaySupportWrapper {
  Widget globalWrap(Widget child) {
    return OverlaySupport.global(child: child);
  }

  Widget localWrap(Widget child) {
    return OverlaySupport.local(child: child);
  }

  void showNotificationMessage(
    String message,
  ) {
    toast(message);
  }

  void showNotificationWidget(Widget content) {
    showSimpleNotification(content);
  }
}
