import 'dart:convert';

class Category {
  final int articles_count;
  final String date_created;
  final int id;
  final String key;
  final String name;
  final int sort_score;
  Category({
    this.articles_count,
    this.date_created,
    this.id,
    this.key,
    this.name,
    this.sort_score,
  });

  Category copyWith({
    int articles_count,
    String date_created,
    int id,
    String key,
    String name,
    int sort_score,
  }) {
    return Category(
      articles_count: articles_count ?? this.articles_count,
      date_created: date_created ?? this.date_created,
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      sort_score: sort_score ?? this.sort_score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'articles_count': articles_count,
      'date_created': date_created,
      'id': id,
      'key': key,
      'name': name,
      'sort_score': sort_score,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Category(
      articles_count: map['articles_count']?.toInt(),
      date_created: map['date_created'],
      id: map['id']?.toInt(),
      key: map['key'],
      name: map['name'],
      sort_score: map['sort_score']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Category fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(articles_count: $articles_count, date_created: $date_created, id: $id, key: $key, name: $name, sort_score: $sort_score)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Category &&
      o.articles_count == articles_count &&
      o.date_created == date_created &&
      o.id == id &&
      o.key == key &&
      o.name == name &&
      o.sort_score == sort_score;
  }

  @override
  int get hashCode {
    return articles_count.hashCode ^
      date_created.hashCode ^
      id.hashCode ^
      key.hashCode ^
      name.hashCode ^
      sort_score.hashCode;
  }
}