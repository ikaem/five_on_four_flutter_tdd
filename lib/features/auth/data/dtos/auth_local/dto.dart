// lib/features/auth/data/dtos/auth_remote/dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';

@freezed
class AuthLocalDTO with _$AuthLocalDTO {
  const factory AuthLocalDTO({
    required String id,
    required String nickname,
    required String email,
    // TODO this is not needed - or maybe is
    required int loggedInAt,
  }) = _AuthLocalDTO;
}
