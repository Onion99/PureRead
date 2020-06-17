import 'dart:convert';

import 'avatar.dart';

class Author {
  final Avatar avatar;
  final String nickname;
  final String title;
  final String ukey;
  Author({
    this.avatar,
    this.nickname,
    this.title,
    this.ukey,
  });

  Author copyWith({
    Avatar avatar,
    String nickname,
    String title,
    String ukey,
  }) {
    return Author(
      avatar: avatar ?? this.avatar,
      nickname: nickname ?? this.nickname,
      title: title ?? this.title,
      ukey: ukey ?? this.ukey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar?.toMap(),
      'nickname': nickname,
      'title': title,
      'ukey': ukey,
    };
  }

  static Author fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Author(
      avatar: Avatar.fromMap(map['avatar']),
      nickname: map['nickname'],
      title: map['title'],
      ukey: map['ukey'],
    );
  }

  String toJson() => json.encode(toMap());

  static Author fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Author(avatar: $avatar, nickname: $nickname, title: $title, ukey: $ukey)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Author &&
      o.avatar == avatar &&
      o.nickname == nickname &&
      o.title == title &&
      o.ukey == ukey;
  }

  @override
  int get hashCode {
    return avatar.hashCode ^
      nickname.hashCode ^
      title.hashCode ^
      ukey.hashCode;
  }
}