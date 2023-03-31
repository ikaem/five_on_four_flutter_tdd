// lib/features/auth/data/dtos/auth_remote/dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part "dto.g.dart";

@freezed
class AuthRemoteDTO with _$AuthRemoteDTO {
  const factory AuthRemoteDTO({
    required String id,
    required String nickname,
    required String email,
    required int loggedInAt,
  }) = _AuthRemoteDTO;

  factory AuthRemoteDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthRemoteDTOFromJson(json);
}
