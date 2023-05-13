import 'package:freezed_annotation/freezed_annotation.dart';

part "args.freezed.dart";
// part "args.g.dart";

@freezed
class RegisterCredentialsArgs with _$RegisterCredentialsArgs {
  const factory RegisterCredentialsArgs({
    required String nickname,
    required String email,
    required String password,
  }) = _RegisterCredentialsArgs;

  const RegisterCredentialsArgs._();

  Map<String, dynamic> toFirebasePlayerDataMap() => <String, String>{
        'nickname': nickname,
        'email': email,
      };

  // factory RegisterCredentialsArgs.fromJson(Map<String, dynamic> json) =>
  //     _$RegisterCredentialsArgsFromJson(json);
}
