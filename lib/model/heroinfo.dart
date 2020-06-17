import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'heroinfo.g.dart';

@JsonSerializable()
class HeroInfo {

  factory HeroInfo.fromJson(Map<String, dynamic> json) => _$HeroInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HeroInfoToJson(this);  

  final String avatarUrl;
  final String name;
  final String e_name;
  final int mOffense;
  final int mDefense;
  final int mMobility;
  final int mTeamUtility;
  final String role;
  final String type;
  final String list_image;
  String get getList_image => "http://web-static.bcgames.163.com/vg/image/heroimages/list-image/"+list_image;
  final String avatar;
  final String detail;
  final String detail_image;
  final String l_detail_image;
  final String stats;
  final String skin_memo;
  final String skin_image;
  final int id;
  final String role_code;
  final String e_role;
  final String type_code;
  final String e_type;
  final bool weeklyFlag;
  HeroInfo({
    this.avatarUrl,
    this.name,
    this.e_name,
    this.mOffense,
    this.mDefense,
    this.mMobility,
    this.mTeamUtility,
    this.role,
    this.type,
    this.list_image,
    this.avatar,
    this.detail,
    this.detail_image,
    this.l_detail_image,
    this.stats,
    this.skin_memo,
    this.skin_image,
    this.id,
    this.role_code,
    this.e_role,
    this.type_code,
    this.e_type,
    this.weeklyFlag,
  });


  HeroInfo copyWith({
    String avatarUrl,
    String name,
    String e_name,
    int mOffense,
    int mDefense,
    int mMobility,
    int mTeamUtility,
    String role,
    String type,
    String list_image,
    String avatar,
    String detail,
    String detail_image,
    String l_detail_image,
    String stats,
    String skin_memo,
    String skin_image,
    int id,
    String role_code,
    String e_role,
    String type_code,
    String e_type,
    bool weeklyFlag,
  }) {
    return HeroInfo(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      e_name: e_name ?? this.e_name,
      mOffense: mOffense ?? this.mOffense,
      mDefense: mDefense ?? this.mDefense,
      mMobility: mMobility ?? this.mMobility,
      mTeamUtility: mTeamUtility ?? this.mTeamUtility,
      role: role ?? this.role,
      type: type ?? this.type,
      list_image: list_image ?? this.list_image,
      avatar: avatar ?? this.avatar,
      detail: detail ?? this.detail,
      detail_image: detail_image ?? this.detail_image,
      l_detail_image: l_detail_image ?? this.l_detail_image,
      stats: stats ?? this.stats,
      skin_memo: skin_memo ?? this.skin_memo,
      skin_image: skin_image ?? this.skin_image,
      id: id ?? this.id,
      role_code: role_code ?? this.role_code,
      e_role: e_role ?? this.e_role,
      type_code: type_code ?? this.type_code,
      e_type: e_type ?? this.e_type,
      weeklyFlag: weeklyFlag ?? this.weeklyFlag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatarUrl': avatarUrl,
      'name': name,
      'e_name': e_name,
      'mOffense': mOffense,
      'mDefense': mDefense,
      'mMobility': mMobility,
      'mTeamUtility': mTeamUtility,
      'role': role,
      'type': type,
      'list_image': list_image,
      'avatar': avatar,
      'detail': detail,
      'detail_image': detail_image,
      'l_detail_image': l_detail_image,
      'stats': stats,
      'skin_memo': skin_memo,
      'skin_image': skin_image,
      'id': id,
      'role_code': role_code,
      'e_role': e_role,
      'type_code': type_code,
      'e_type': e_type,
      'weeklyFlag': weeklyFlag,
    };
  }

  static HeroInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return HeroInfo(
      avatarUrl: map['avatarUrl'],
      name: map['name'],
      e_name: map['e_name'],
      mOffense: map['mOffense'],
      mDefense: map['mDefense'],
      mMobility: map['mMobility'],
      mTeamUtility: map['mTeamUtility'],
      role: map['role'],
      type: map['type'],
      list_image: map['list_image'],
      avatar: map['avatar'],
      detail: map['detail'],
      detail_image: map['detail_image'],
      l_detail_image: map['l_detail_image'],
      stats: map['stats'],
      skin_memo: map['skin_memo'],
      skin_image: map['skin_image'],
      id: map['id'],
      role_code: map['role_code'],
      e_role: map['e_role'],
      type_code: map['type_code'],
      e_type: map['e_type'],
      weeklyFlag: map['weeklyFlag'],
    );
  }


  @override
  String toString() {
    return 'HeroInfo(avatarUrl: $avatarUrl, name: $name, e_name: $e_name, mOffense: $mOffense, mDefense: $mDefense, mMobility: $mMobility, mTeamUtility: $mTeamUtility, role: $role, type: $type, list_image: $list_image, avatar: $avatar, detail: $detail, detail_image: $detail_image, l_detail_image: $l_detail_image, stats: $stats, skin_memo: $skin_memo, skin_image: $skin_image, id: $id, role_code: $role_code, e_role: $e_role, type_code: $type_code, e_type: $e_type, weeklyFlag: $weeklyFlag)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is HeroInfo &&
      o.avatarUrl == avatarUrl &&
      o.name == name &&
      o.e_name == e_name &&
      o.mOffense == mOffense &&
      o.mDefense == mDefense &&
      o.mMobility == mMobility &&
      o.mTeamUtility == mTeamUtility &&
      o.role == role &&
      o.type == type &&
      o.list_image == list_image &&
      o.avatar == avatar &&
      o.detail == detail &&
      o.detail_image == detail_image &&
      o.l_detail_image == l_detail_image &&
      o.stats == stats &&
      o.skin_memo == skin_memo &&
      o.skin_image == skin_image &&
      o.id == id &&
      o.role_code == role_code &&
      o.e_role == e_role &&
      o.type_code == type_code &&
      o.e_type == e_type &&
      o.weeklyFlag == weeklyFlag;
  }

  @override
  int get hashCode {
    return avatarUrl.hashCode ^
      name.hashCode ^
      e_name.hashCode ^
      mOffense.hashCode ^
      mDefense.hashCode ^
      mMobility.hashCode ^
      mTeamUtility.hashCode ^
      role.hashCode ^
      type.hashCode ^
      list_image.hashCode ^
      avatar.hashCode ^
      detail.hashCode ^
      detail_image.hashCode ^
      l_detail_image.hashCode ^
      stats.hashCode ^
      skin_memo.hashCode ^
      skin_image.hashCode ^
      id.hashCode ^
      role_code.hashCode ^
      e_role.hashCode ^
      type_code.hashCode ^
      e_type.hashCode ^
      weeklyFlag.hashCode;
  }
}
