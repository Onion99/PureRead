import 'dart:convert';

import 'package:pure_read/model/news.dart';

class ResultDataNews {
  int code;
  String message;
  List<News> result;
  ResultDataNews({
    this.code,
    this.message,
    this.result,
  });
 

  ResultDataNews copyWith({
    int code,
    String message,
    List<News> result,
  }) {
    return ResultDataNews(
      code: code ?? this.code,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'result': List<dynamic>.from(result.map((x) => x.toMap())),
    };
  }

  static ResultDataNews fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultDataNews(
      code: map['code'],
      message: map['message'],
      result: List<News>.from(map['result']?.map((x) => News.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static ResultDataNews fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ResultDataNews(code: $code, message: $message, result: $result)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ResultDataNews &&
      o.code == code &&
      o.message == message &&
      o.result == result;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ result.hashCode;
}
