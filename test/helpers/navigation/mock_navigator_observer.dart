import 'package:flutter/material.dart';

// TODO this is not used anymore
class MockNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> _history = [];
  List<Route<dynamic>> get history => _history;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.remove(route);
    super.didPop(route, previousRoute);
  }
}
