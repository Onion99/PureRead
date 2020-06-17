import 'dart:convert';

class EventData {
  final int id;
  final String topicId;
  final int eventType;
  final String entityId;
  final String entityType;
  final String entityName;
  final int state;
  final String createdAt;
  final String updatedAt;
  EventData({
    this.id,
    this.topicId,
    this.eventType,
    this.entityId,
    this.entityType,
    this.entityName,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  EventData copyWith({
    int id,
    String topicId,
    int eventType,
    String entityId,
    String entityType,
    String entityName,
    int state,
    String createdAt,
    String updatedAt,
  }) {
    return EventData(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      eventType: eventType ?? this.eventType,
      entityId: entityId ?? this.entityId,
      entityType: entityType ?? this.entityType,
      entityName: entityName ?? this.entityName,
      state: state ?? this.state,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topicId': topicId,
      'eventType': eventType,
      'entityId': entityId,
      'entityType': entityType,
      'entityName': entityName,
      'state': state,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  static EventData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return EventData(
      id: map['id']?.toInt(),
      topicId: map['topicId'],
      eventType: map['eventType']?.toInt(),
      entityId: map['entityId'],
      entityType: map['entityType'],
      entityName: map['entityName'],
      state: map['state']?.toInt(),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  static EventData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventData(id: $id, topicId: $topicId, eventType: $eventType, entityId: $entityId, entityType: $entityType, entityName: $entityName, state: $state, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is EventData &&
      o.id == id &&
      o.topicId == topicId &&
      o.eventType == eventType &&
      o.entityId == entityId &&
      o.entityType == entityType &&
      o.entityName == entityName &&
      o.state == state &&
      o.createdAt == createdAt &&
      o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      topicId.hashCode ^
      eventType.hashCode ^
      entityId.hashCode ^
      entityType.hashCode ^
      entityName.hashCode ^
      state.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}