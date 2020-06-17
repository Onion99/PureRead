// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hero _$HeroFromJson(Map<String, dynamic> json) {
  return Hero(
    avatarUrl: json['avatarUrl'] as String,
    name: json['name'] as String,
    e_name: json['e_name'] as String,
    mOffense: json['mOffense'] as int,
    mDefense: json['mDefense'] as int,
    mMobility: json['mMobility'] as int,
    mTeamUtility: json['mTeamUtility'] as int,
    role: json['role'] as String,
    type: json['type'] as String,
    list_image: json['list_image'] as String,
    avatar: json['avatar'] as String,
    detail: json['detail'] as String,
    detail_image: json['detail_image'] as String,
    l_detail_image: json['l_detail_image'] as String,
    stats: json['stats'] as String,
    skin_memo: json['skin_memo'] as String,
    skin_image: json['skin_image'] as String,
    id: json['id'] as int,
    role_code: json['role_code'] as String,
    e_role: json['e_role'] as String,
    type_code: json['type_code'] as String,
    e_type: json['e_type'] as String,
    weeklyFlag: json['weeklyFlag'] as bool,
  );
}

Map<String, dynamic> _$HeroToJson(Hero instance) => <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'name': instance.name,
      'e_name': instance.e_name,
      'mOffense': instance.mOffense,
      'mDefense': instance.mDefense,
      'mMobility': instance.mMobility,
      'mTeamUtility': instance.mTeamUtility,
      'role': instance.role,
      'type': instance.type,
      'list_image': instance.list_image,
      'avatar': instance.avatar,
      'detail': instance.detail,
      'detail_image': instance.detail_image,
      'l_detail_image': instance.l_detail_image,
      'stats': instance.stats,
      'skin_memo': instance.skin_memo,
      'skin_image': instance.skin_image,
      'id': instance.id,
      'role_code': instance.role_code,
      'e_role': instance.e_role,
      'type_code': instance.type_code,
      'e_type': instance.e_type,
      'weeklyFlag': instance.weeklyFlag,
    };
