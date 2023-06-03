import 'package:five_on_four_flutter_tdd/features/players/data/dtos/player_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "model.freezed.dart";

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String id,
    required String nickname,
    required String email,
    required PlayerPreferencesModel preferences,
  }) = _PlayerModel;

  factory PlayerModel.fromRemoteDTO(PlayerRemoteDTO remoteDTO) {
    final PlayerPreferencesModel preferences =
        PlayerPreferencesModel.fromRemoteDTO(
      remoteDTO.preferences,
    );

    final PlayerModel model = PlayerModel(
      id: remoteDTO.id,
      nickname: remoteDTO.nickname,
      email: remoteDTO.email,
      preferences: preferences,
    );

    return model;
  }
}

// TODO move to its own file
@freezed
class PlayerPreferencesModel with _$PlayerPreferencesModel {
  const factory PlayerPreferencesModel({
    required int? regionSize,
  }) = _PlayerPreferencesModel;

  factory PlayerPreferencesModel.fromRemoteDTO(
      PlayerPreferencesRemoteDTO remoteDTO) {
    final PlayerPreferencesModel model = PlayerPreferencesModel(
      regionSize: remoteDTO.regionSize,
    );

    return model;
  }
}
