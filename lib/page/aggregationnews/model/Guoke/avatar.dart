import 'dart:convert';

class Avatar {
  final String large;
  final String normal;
  final String small;
  Avatar({
    this.large,
    this.normal,
    this.small,
  });

  Avatar copyWith({
    String large,
    String normal,
    String small,
  }) {
    return Avatar(
      large: large ?? this.large,
      normal: normal ?? this.normal,
      small: small ?? this.small,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'normal': normal,
      'small': small,
    };
  }

  static Avatar fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Avatar(
      large: map['large'],
      normal: map['normal'],
      small: map['small'],
    );
  }

  String toJson() => json.encode(toMap());

  static Avatar fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Avatar(large: $large, normal: $normal, small: $small)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Avatar &&
      o.large == large &&
      o.normal == normal &&
      o.small == small;
  }

  @override
  int get hashCode => large.hashCode ^ normal.hashCode ^ small.hashCode;
}