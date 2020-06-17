import 'dart:convert';

class ZhihuDayDetail {
  String body;
  String image_hue;
  String image_source;
  String title;
  String url;
  String image;
  String share_url;
  String ga_prefix;
  List<String> images;
  int type;
  int id;
  ZhihuDayDetail({
    this.body,
    this.image_hue,
    this.image_source,
    this.title,
    this.url,
    this.image,
    this.share_url,
    this.ga_prefix,
    this.images,
    this.type,
    this.id,
  });

  ZhihuDayDetail copyWith({
    String body,
    String image_hue,
    String image_source,
    String title,
    String url,
    String image,
    String share_url,
    String ga_prefix,
    List<String> images,
    int type,
    int id,
  }) {
    return ZhihuDayDetail(
      body: body ?? this.body,
      image_hue: image_hue ?? this.image_hue,
      image_source: image_source ?? this.image_source,
      title: title ?? this.title,
      url: url ?? this.url,
      image: image ?? this.image,
      share_url: share_url ?? this.share_url,
      ga_prefix: ga_prefix ?? this.ga_prefix,
      images: images ?? this.images,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'image_hue': image_hue,
      'image_source': image_source,
      'title': title,
      'url': url,
      'image': image,
      'share_url': share_url,
      'ga_prefix': ga_prefix,
      'images': List<dynamic>.from(images.map((x) => x)),
      'type': type,
      'id': id,
    };
  }

  static ZhihuDayDetail fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ZhihuDayDetail(
      body: map['body'],
      image_hue: map['image_hue'],
      image_source: map['image_source'],
      title: map['title'],
      url: map['url'],
      image: map['image'],
      share_url: map['share_url'],
      ga_prefix: map['ga_prefix'],
      images: List<String>.from(map['images']),
      type: map['type'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  static ZhihuDayDetail fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZhihuDayDetail(body: $body, image_hue: $image_hue, image_source: $image_source, title: $title, url: $url, image: $image, share_url: $share_url, ga_prefix: $ga_prefix, images: $images, type: $type, id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ZhihuDayDetail &&
      o.body == body &&
      o.image_hue == image_hue &&
      o.image_source == image_source &&
      o.title == title &&
      o.url == url &&
      o.image == image &&
      o.share_url == share_url &&
      o.ga_prefix == ga_prefix &&
      o.images == images &&
      o.type == type &&
      o.id == id;
  }

  @override
  int get hashCode {
    return body.hashCode ^
      image_hue.hashCode ^
      image_source.hashCode ^
      title.hashCode ^
      url.hashCode ^
      image.hashCode ^
      share_url.hashCode ^
      ga_prefix.hashCode ^
      images.hashCode ^
      type.hashCode ^
      id.hashCode;
  }
}
