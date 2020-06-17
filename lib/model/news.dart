import 'dart:convert';

class News {
  String path;
  String image;
  String title;
  String passtime;
  News({
    this.path,
    this.image,
    this.title,
    this.passtime,
  });

  News copyWith({
    String path,
    String image,
    String title,
    String passtime,
  }) {
    return News(
      path: path ?? this.path,
      image: image ?? this.image,
      title: title ?? this.title,
      passtime: passtime ?? this.passtime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'image': image,
      'title': title,
      'passtime': passtime,
    };
  }

  static News fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return News(
      path: map['path'],
      image: map['image'],
      title: map['title'],
      passtime: map['passtime'],
    );
  }

  String toJson() => json.encode(toMap());

  static News fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(path: $path, image: $image, title: $title, passtime: $passtime)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is News &&
        o.path == path &&
        o.image == image &&
        o.title == title &&
        o.passtime == passtime;
  }

  @override
  int get hashCode {
    return path.hashCode ^ image.hashCode ^ title.hashCode ^ passtime.hashCode;
  }
}
