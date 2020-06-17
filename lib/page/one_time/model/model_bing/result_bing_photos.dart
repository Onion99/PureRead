import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'image.dart';
import 'tooltips.dart';

class ResultBingPhotoData {
  final List<Image> images;
  final Tooltips tooltips;
  ResultBingPhotoData({
    this.images,
    this.tooltips,
  });

  ResultBingPhotoData copyWith({
    List<Image> images,
    Tooltips tooltips,
  }) {
    return ResultBingPhotoData(
      images: images ?? this.images,
      tooltips: tooltips ?? this.tooltips,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'images': List<dynamic>.from(images.map((x) => x.toMap())),
      'tooltips': tooltips.toMap(),
    };
  }

  static ResultBingPhotoData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultBingPhotoData(
      images: List<Image>.from(map['images']?.map((x) => Image.fromMap(x))),
      tooltips: Tooltips.fromMap(map['tooltips']),
    );
  }

  String toJson() => json.encode(toMap());

  static ResultBingPhotoData fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'ResultBingPhotoData(images: $images, tooltips: $tooltips)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ResultBingPhotoData &&
      listEquals(o.images, images) &&
      o.tooltips == tooltips;
  }

  @override
  int get hashCode => images.hashCode ^ tooltips.hashCode;
}