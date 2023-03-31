// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthRemoteDTO _$$_AuthRemoteDTOFromJson(Map<String, dynamic> json) =>
    _$_AuthRemoteDTO(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      loggedInAt: json['loggedInAt'] as int,
    );

Map<String, dynamic> _$$_AuthRemoteDTOToJson(_$_AuthRemoteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'email': instance.email,
      'loggedInAt': instance.loggedInAt,
    };
