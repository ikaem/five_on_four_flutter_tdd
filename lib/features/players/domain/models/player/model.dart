import 'package:freezed_annotation/freezed_annotation.dart';

part "model.freezed.dart";

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String id,
    required String nickname,
    required String email,
  }) = _PlayerModel;
}
