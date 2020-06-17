import 'dart:convert';

class ZhihuDay {
  final String image_hue;
  final String title;
  final String url;
  final String hint;
  final String ga_prefix;
  final List<String> images;
  final int type;
  final int id;
  ZhihuDay({
    this.image_hue,
    this.title,
    this.url,
    this.hint,
    this.ga_prefix,
    this.images,
    this.type,
    this.id,
  });

  ZhihuDay copyWith({
    String image_hue,
    String title,
    String url,
    String hint,
    String ga_prefix,
    List<String> images,
    int type,
    int id,
  }) {
    return ZhihuDay(
      image_hue: image_hue ?? this.image_hue,
      title: title ?? this.title,
      url: url ?? this.url,
      hint: hint ?? this.hint,
      ga_prefix: ga_prefix ?? this.ga_prefix,
      images: images ?? this.images,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image_hue': image_hue,
      'title': title,
      'url': url,
      'hint': hint,
      'ga_prefix': ga_prefix,
      'images': List<dynamic>.from(images.map((x) => x)),
      'type': type,
      'id': id,
    };
  }

  static ZhihuDay fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ZhihuDay(
      image_hue: map['image_hue'],
      title: map['title'],
      url: map['url'],
      hint: map['hint'],
      ga_prefix: map['ga_prefix'],
      images: List<String>.from(map['images']),
      type: map['type']?.toInt(),
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static ZhihuDay fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZhihuDay(image_hue: $image_hue, title: $title, url: $url, hint: $hint, ga_prefix: $ga_prefix, images: $images, type: $type, id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ZhihuDay &&
      o.image_hue == image_hue &&
      o.title == title &&
      o.url == url &&
      o.hint == hint &&
      o.ga_prefix == ga_prefix &&
      o.images == images &&
      o.type == type &&
      o.id == id;
  }

  @override
  int get hashCode {
    return image_hue.hashCode ^
      title.hashCode ^
      url.hashCode ^
      hint.hashCode ^
      ga_prefix.hashCode ^
      images.hashCode ^
      type.hashCode ^
      id.hashCode;
  }
}