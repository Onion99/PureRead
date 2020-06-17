import 'dart:convert';

class Tooltips {
  final String loading;
  final String previous;
  final String next;
  final String walle;
  final String walls;
  Tooltips({
    this.loading,
    this.previous,
    this.next,
    this.walle,
    this.walls,
  });

  Tooltips copyWith({
    String loading,
    String previous,
    String next,
    String walle,
    String walls,
  }) {
    return Tooltips(
      loading: loading ?? this.loading,
      previous: previous ?? this.previous,
      next: next ?? this.next,
      walle: walle ?? this.walle,
      walls: walls ?? this.walls,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loading': loading,
      'previous': previous,
      'next': next,
      'walle': walle,
      'walls': walls,
    };
  }

  static Tooltips fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Tooltips(
      loading: map['loading'],
      previous: map['previous'],
      next: map['next'],
      walle: map['walle'],
      walls: map['walls'],
    );
  }

  String toJson() => json.encode(toMap());

  static Tooltips fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tooltips(loading: $loading, previous: $previous, next: $next, walle: $walle, walls: $walls)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Tooltips &&
      o.loading == loading &&
      o.previous == previous &&
      o.next == next &&
      o.walle == walle &&
      o.walls == walls;
  }

  @override
  int get hashCode {
    return loading.hashCode ^
      previous.hashCode ^
      next.hashCode ^
      walle.hashCode ^
      walls.hashCode;
  }
}