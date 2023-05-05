import 'package:flutter/material.dart';

abstract class KeysConstants {
  // screens
  // TODO possibly use Key here already
  static const splashScreenScaffoldKey = 'splash_screen_scaffold';
  static const mainScreenScaffoldKey = 'main_screen_scaffold';
  static const loginScreenScaffoldKey = 'login_screen_scaffold';
  static const registerScreenScaffoldKey = 'register_screen_scaffold';
  static const homeScreenScaffoldKey = 'home_screen_scaffold';
  static const matchInfoScreenScaffoldKey = 'match_info_screen_scaffold';
  static const playersScreenScaffoldKey = 'players_screen_scaffold';
  static const matchesScreenScaffoldKey = 'matches_screen_scaffold';
  static const playerInfoScreenScaffoldKey = 'player_info_screen_scaffold';

  // navigator
  // https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
}
