import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/exceptions/player_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
// part "dto.g.dart";

@freezed
class PlayerRemoteDTO with _$PlayerRemoteDTO {
  const factory PlayerRemoteDTO({
    required String id,
    required String nickname,
    required String email,
    required PlayerPreferencesRemoteDTO preferences,
    // TODO remotely, device token should probabyle saved into a nested object on playaer document
  }) = _PlayerRemoteDTO;

  factory PlayerRemoteDTO.fromFirestoreDoc({
    required DocumentSnapshot<Map<String, dynamic>> playerDoc,
  }) {
    final String playerId = playerDoc.id;
    final Map<String, dynamic>? playerData = playerDoc.data();

    if (playerData == null) {
      throw PlayerExceptionNotFoundRemote(
        message: "Player data is null: $playerId",
      );
    }

    final Map<String, dynamic>? playerPreferencesData =
        playerData["preferences"] as Map<String, dynamic>?;

    final PlayerPreferencesRemoteDTO playerPreferencesRemoteDTO =
        playerPreferencesData == null
            ? PlayerPreferencesRemoteDTO.empty()
            : PlayerPreferencesRemoteDTO.fromMap(map: playerPreferencesData);

    final PlayerRemoteDTO playerRemoteDTO = PlayerRemoteDTO(
      id: playerId,
      nickname: playerData["nickname"] as String,
      email: playerData["email"] as String,
      preferences: playerPreferencesRemoteDTO,
    );

    return playerRemoteDTO;
  }

  // factory PlayerRemoteDTO.fromJson(Map<String, dynamic> json) =>
  //     _$PlayerRemoteDTOFromJson(json);
}

// TODO possibly move this to its own dto file
@freezed
class PlayerPreferencesRemoteDTO with _$PlayerPreferencesRemoteDTO {
  const factory PlayerPreferencesRemoteDTO({
    required int? regionSize,
  }) = _PlayerPreferencesRemoteDTO;

  factory PlayerPreferencesRemoteDTO.fromMap({
    required Map<String, dynamic> map,
  }) {
    final int? regionSize = map["regionSize"] as int?;

    final PlayerPreferencesRemoteDTO playerPreferencesRemoteDTO =
        PlayerPreferencesRemoteDTO(
      regionSize: regionSize,
    );

    return playerPreferencesRemoteDTO;
  }

  factory PlayerPreferencesRemoteDTO.empty() =>
      PlayerPreferencesRemoteDTO(regionSize: null);
}
