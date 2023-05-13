import 'package:freezed_annotation/freezed_annotation.dart';

part "args.freezed.dart";
// part "args.g.dart";

@freezed
class LoginCredentialsArgs with _$LoginCredentialsArgs {
  const factory LoginCredentialsArgs({
    required String email,
    required String password,
  }) = _LoginCredentialsArgs;

// TODO not needed
  // factory LoginCredentialsArgs.fromJson(Map<String, dynamic> json) =>
  //     _$LoginCredentialsArgsFromJson(json);
}
