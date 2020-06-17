import 'dart:convert';

import 'GuokeDay.dart';


class GuokeResult {
  final String now;
  final bool ok;
  final int limit;
  final List<GuokeDay> result;
  GuokeResult({
    this.now,
    this.ok,
    this.limit,
    this.result,
  });
  

  GuokeResult copyWith({
    String now,
    bool ok,
    int limit,
    List<GuokeDay> result,
  }) {
    return GuokeResult(
      now: now ?? this.now,
      ok: ok ?? this.ok,
      limit: limit ?? this.limit,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'now': now,
      'ok': ok,
      'limit': limit,
      'result': List<dynamic>.from(result.map((x) => x.toMap())),
    };
  }

  static GuokeResult fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return GuokeResult(
      now: map['now'],
      ok: map['ok'],
      limit: map['limit'],
      result: List<GuokeDay>.from(map['result']?.map((x) => GuokeDay.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static GuokeResult fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'GuokeResult(now: $now, ok: $ok, limit: $limit, result: $result)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is GuokeResult &&
      o.now == now &&
      o.ok == ok &&
      o.limit == limit &&
      o.result == result;
  }

  @override
  int get hashCode {
    return now.hashCode ^
      ok.hashCode ^
      limit.hashCode ^
      result.hashCode;
  }
}

