import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "model.freezed.dart";

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String id,
    required String nickname,
    required String email,
  }) = _PlayerModel;

  factory PlayerModel.fromRemoteDTO(PlayerRemoteDTO remoteDTO) {
    final PlayerModel model = PlayerModel(
      id: remoteDTO.id,
      nickname: remoteDTO.nickname,
      email: remoteDTO.email,
    );

    return model;
  }
}
