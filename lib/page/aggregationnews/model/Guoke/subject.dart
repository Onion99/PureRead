import 'dart:convert';

class Subject {
  final int articles_count;
  final String date_created;
  final String key;
  final String minisite_key;
  final String name;
  final int sort_score;
  final String subject_type;
  Subject({
    this.articles_count,
    this.date_created,
    this.key,
    this.minisite_key,
    this.name,
    this.sort_score,
    this.subject_type,
  });

  Subject copyWith({
    int articles_count,
    String date_created,
    String key,
    String minisite_key,
    String name,
    int sort_score,
    String subject_type,
  }) {
    return Subject(
      articles_count: articles_count ?? this.articles_count,
      date_created: date_created ?? this.date_created,
      key: key ?? this.key,
      minisite_key: minisite_key ?? this.minisite_key,
      name: name ?? this.name,
      sort_score: sort_score ?? this.sort_score,
      subject_type: subject_type ?? this.subject_type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'articles_count': articles_count,
      'date_created': date_created,
      'key': key,
      'minisite_key': minisite_key,
      'name': name,
      'sort_score': sort_score,
      'subject_type': subject_type,
    };
  }

  static Subject fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Subject(
      articles_count: map['articles_count']?.toInt(),
      date_created: map['date_created'],
      key: map['key'],
      minisite_key: map['minisite_key'],
      name: map['name'],
      sort_score: map['sort_score']?.toInt(),
      subject_type: map['subject_type'],
    );
  }

  String toJson() => json.encode(toMap());

  static Subject fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Subject(articles_count: $articles_count, date_created: $date_created, key: $key, minisite_key: $minisite_key, name: $name, sort_score: $sort_score, subject_type: $subject_type)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Subject &&
      o.articles_count == articles_count &&
      o.date_created == date_created &&
      o.key == key &&
      o.minisite_key == minisite_key &&
      o.name == name &&
      o.sort_score == sort_score &&
      o.subject_type == subject_type;
  }

  @override
  int get hashCode {
    return articles_count.hashCode ^
      date_created.hashCode ^
      key.hashCode ^
      minisite_key.hashCode ^
      name.hashCode ^
      sort_score.hashCode ^
      subject_type.hashCode;
  }
}