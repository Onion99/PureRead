import 'dart:convert';

class Extra {
  final bool instantView;
  Extra({
    this.instantView,
  });

  Extra copyWith({
    bool instantView,
  }) {
    return Extra(
      instantView: instantView ?? this.instantView,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'instantView': instantView,
    };
  }

  static Extra fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Extra(
      instantView: map['instantView'],
    );
  }

  String toJson() => json.encode(toMap());

  static Extra fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Extra(instantView: $instantView)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Extra &&
      o.instantView == instantView;
  }

  @override
  int get hashCode => instantView.hashCode;
}