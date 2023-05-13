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

    final PlayerRemoteDTO playerRemoteDTO = PlayerRemoteDTO(
      id: playerId,
      nickname: playerData["nickname"] as String,
      email: playerData["email"] as String,
    );

    return playerRemoteDTO;
  }

  // factory PlayerRemoteDTO.fromJson(Map<String, dynamic> json) =>
  //     _$PlayerRemoteDTOFromJson(json);
}
