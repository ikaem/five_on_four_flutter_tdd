import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    // TODO test only
    // required PlayerModel player,
    required int loggedInAt,
    // TODO test new
    required String id,
    // TODO these two might not be needed eventually
    required String nickname,
    required String email,
  }) = _AuthModel;

  factory AuthModel.fromLocalDTO(AuthLocalDTO localDTO) {
    // TODO not needed
    // final PlayerModel player = PlayerModel(
    //   id: localDTO.id,
    //   nickname: localDTO.nickname,
    //   email: localDTO.email,
    // );
    return AuthModel(
      // player: player,
      loggedInAt: localDTO.loggedInAt,
      id: localDTO.id,
      nickname: localDTO.nickname,
      email: localDTO.email,
    );
  }
}
