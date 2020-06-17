import 'dart:convert';

class OneSay {
  final int id;
  final String hitokoto;
  final String type;
  final String from;
  final String creator;
  final String from_who;
  final int creator_uid;
  final int reviewer;
  final String uuid;
  final String created_at;
  OneSay({
    this.id,
    this.hitokoto,
    this.type,
    this.from,
    this.creator,
    this.from_who,
    this.creator_uid,
    this.reviewer,
    this.uuid,
    this.created_at,
  });
  

  OneSay copyWith({
    int id,
    String hitokoto,
    String type,
    String from,
    String creator,
    String from_who,
    int creator_uid,
    int reviewer,
    String uuid,
    String created_at,
  }) {
    return OneSay(
      id: id ?? this.id,
      hitokoto: hitokoto ?? this.hitokoto,
      type: type ?? this.type,
      from: from ?? this.from,
      creator: creator ?? this.creator,
      from_who: from_who ?? this.from_who,
      creator_uid: creator_uid ?? this.creator_uid,
      reviewer: reviewer ?? this.reviewer,
      uuid: uuid ?? this.uuid,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hitokoto': hitokoto,
      'type': type,
      'from': from,
      'creator': creator,
      'from_who': from_who,
      'creator_uid': creator_uid,
      'reviewer': reviewer,
      'uuid': uuid,
      'created_at': created_at,
    };
  }

  static OneSay fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return OneSay(
      id: map['id'],
      hitokoto: map['hitokoto'],
      type: map['type'],
      from: map['from'],
      creator: map['creator'],
      from_who: map['from_who'],
      creator_uid: map['creator_uid'],
      reviewer: map['reviewer'],
      uuid: map['uuid'],
      created_at: map['created_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static OneSay fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'OneSay(id: $id, hitokoto: $hitokoto, type: $type, from: $from, creator: $creator, from_who: $from_who, creator_uid: $creator_uid, reviewer: $reviewer, uuid: $uuid, created_at: $created_at)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is OneSay &&
      o.id == id &&
      o.hitokoto == hitokoto &&
      o.type == type &&
      o.from == from &&
      o.creator == creator &&
      o.from_who == from_who &&
      o.creator_uid == creator_uid &&
      o.reviewer == reviewer &&
      o.uuid == uuid &&
      o.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      hitokoto.hashCode ^
      type.hashCode ^
      from.hashCode ^
      creator.hashCode ^
      from_who.hashCode ^
      creator_uid.hashCode ^
      reviewer.hashCode ^
      uuid.hashCode ^
      created_at.hashCode;
  }
}

