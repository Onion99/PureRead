
import 'dart:convert';

import 'package:pure_read/page/aggregationnews/model/zhihuday.dart';


class ResultZhihu {
  String date;
  List<ZhihuDay> stories;
  
  ResultZhihu({
    this.date,
    this.stories,
  });
  

  ResultZhihu copyWith({
    String date,
    List<ZhihuDay> stories,
  }) {
    return ResultZhihu(
      date: date ?? this.date,
      stories: stories ?? this.stories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'stories': List<dynamic>.from(stories.map((x) => x.toMap())),
    };
  }

  static ResultZhihu fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultZhihu(
      date: map['date'],
      stories: List<ZhihuDay>.from(map['stories']?.map((x) => ZhihuDay.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static ResultZhihu fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ResultZhihu(date: $date, stories: $stories)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ResultZhihu &&
      o.date == date &&
      o.stories == stories;
  }

  @override
  int get hashCode => date.hashCode ^ stories.hashCode;
}
