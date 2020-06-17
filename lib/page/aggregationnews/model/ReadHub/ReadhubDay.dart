import 'dart:convert';

import 'event_data.dart';
import 'extra.dart';
import 'news_array.dart';

class ReadhubDay {
  final String id;
  final List<NewsArray> newsArray;
  final String createdAt;
  final List<EventData> eventData;
  final String publishDate;
  final String summary;
  final String title;
  final String updatedAt;
  final String timeline;
  final int order;
  final bool hasInstantView;
  final Extra extra;
  ReadhubDay({
    this.id,
    this.newsArray,
    this.createdAt,
    this.eventData,
    this.publishDate,
    this.summary,
    this.title,
    this.updatedAt,
    this.timeline,
    this.order,
    this.hasInstantView,
    this.extra,
  });

  ReadhubDay copyWith({
    String id,
    List<NewsArray> newsArray,
    String createdAt,
    List<EventData> eventData,
    String publishDate,
    String summary,
    String title,
    String updatedAt,
    String timeline,
    int order,
    bool hasInstantView,
    Extra extra,
  }) {
    return ReadhubDay(
      id: id ?? this.id,
      newsArray: newsArray ?? this.newsArray,
      createdAt: createdAt ?? this.createdAt,
      eventData: eventData ?? this.eventData,
      publishDate: publishDate ?? this.publishDate,
      summary: summary ?? this.summary,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
      timeline: timeline ?? this.timeline,
      order: order ?? this.order,
      hasInstantView: hasInstantView ?? this.hasInstantView,
      extra: extra ?? this.extra,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'newsArray': List<dynamic>.from(newsArray.map((x) => x.toMap())),
      'createdAt': createdAt,
      'eventData': List<dynamic>.from(eventData.map((x) => x.toMap())),
      'publishDate': publishDate,
      'summary': summary,
      'title': title,
      'updatedAt': updatedAt,
      'timeline': timeline,
      'order': order,
      'hasInstantView': hasInstantView,
      'extra': extra.toMap(),
    };
  }

  static ReadhubDay fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ReadhubDay(
      id: map['id'],
      newsArray: List<NewsArray>.from(map['newsArray']?.map((x) => NewsArray.fromMap(x))),
      createdAt: map['createdAt'],
      eventData: List<EventData>.from(map['eventData']?.map((x) => EventData.fromMap(x))),
      publishDate: map['publishDate'],
      summary: map['summary'],
      title: map['title'],
      updatedAt: map['updatedAt'],
      timeline: map['timeline'],
      order: map['order']?.toInt(),
      hasInstantView: map['hasInstantView'],
      extra: Extra.fromMap(map['extra']),
    );
  }

  String toJson() => json.encode(toMap());

  static ReadhubDay fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReadhubDay(id: $id, newsArray: $newsArray, createdAt: $createdAt, eventData: $eventData, publishDate: $publishDate, summary: $summary, title: $title, updatedAt: $updatedAt, timeline: $timeline, order: $order, hasInstantView: $hasInstantView, extra: $extra)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ReadhubDay &&
      o.id == id &&
      o.newsArray == newsArray &&
      o.createdAt == createdAt &&
      o.eventData == eventData &&
      o.publishDate == publishDate &&
      o.summary == summary &&
      o.title == title &&
      o.updatedAt == updatedAt &&
      o.timeline == timeline &&
      o.order == order &&
      o.hasInstantView == hasInstantView &&
      o.extra == extra;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      newsArray.hashCode ^
      createdAt.hashCode ^
      eventData.hashCode ^
      publishDate.hashCode ^
      summary.hashCode ^
      title.hashCode ^
      updatedAt.hashCode ^
      timeline.hashCode ^
      order.hashCode ^
      hasInstantView.hashCode ^
      extra.hashCode;
  }
}