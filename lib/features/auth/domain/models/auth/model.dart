import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required PlayerModel player,
    required int loggedInAt,
  }) = _AuthModel;

  factory AuthModel.fromLocalDTO(AuthLocalDTO localDTO) {
    final PlayerModel player = PlayerModel(
      id: localDTO.id,
      nickname: localDTO.nickname,
      email: localDTO.email,
    );
    return AuthModel(
      player: player,
      loggedInAt: localDTO.loggedInAt,
    );
  }
}
