// lib/features/auth/data/dtos/auth_remote/dto.dart
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';

@freezed
class AuthLocalDTO with _$AuthLocalDTO {
  const factory AuthLocalDTO({
    required String id,
    required String nickname,
    required String email,
    required int loggedInAt,
    // TODO we might need token here in future
  }) = _AuthLocalDTO;

  factory AuthLocalDTO.fromRemoteDTO(AuthRemoteDTO remoteDTO) {
    final AuthLocalDTO authLocalDTO = AuthLocalDTO(
      id: remoteDTO.id,
      nickname: remoteDTO.nickname,
      email: remoteDTO.email,
      loggedInAt: remoteDTO.loggedInAt,
    );

    return authLocalDTO;
  }
}
