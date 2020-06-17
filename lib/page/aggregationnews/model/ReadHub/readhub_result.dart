import 'dart:convert';

import 'ReadhubDay.dart';


class ReadhubResult {
  List<ReadhubDay> data;
  ReadhubResult({
    this.data,
  });
  

  ReadhubResult copyWith({
    List<ReadhubDay> data,
  }) {
    return ReadhubResult(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toMap())),
    };
  }

  static ReadhubResult fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ReadhubResult(
      data: List<ReadhubDay>.from(map['data']?.map((x) => ReadhubDay.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static ReadhubResult fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ReadhubResult(data: $data)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ReadhubResult &&
      o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
