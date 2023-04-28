import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:flutter/material.dart';

abstract class AuthStatusNewController extends ChangeNotifier {
  bool get isAuthenticated;
  AuthModel? get auth;
  bool get isLoading;
}
