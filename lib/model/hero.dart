import 'package:json_annotation/json_annotation.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero {

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
  Map<String, dynamic> toJson() => _$HeroToJson(this);  

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
  Hero({
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
  
  @override
  String toString() {
    return 'Hero(avatarUrl: $avatarUrl, name: $name, e_name: $e_name, mOffense: $mOffense, mDefense: $mDefense, mMobility: $mMobility, mTeamUtility: $mTeamUtility, role: $role, type: $type, list_image: $list_image, avatar: $avatar, detail: $detail, detail_image: $detail_image, l_detail_image: $l_detail_image, stats: $stats, skin_memo: $skin_memo, skin_image: $skin_image, id: $id, role_code: $role_code, e_role: $e_role, type_code: $type_code, e_type: $e_type, weeklyFlag: $weeklyFlag)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Hero &&
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
