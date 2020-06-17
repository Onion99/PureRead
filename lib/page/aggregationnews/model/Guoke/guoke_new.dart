

import 'dart:convert';

import 'package:collection/collection.dart';

import 'author.dart';
import 'category.dart';
import 'subject.dart';

class Guokenews {
  final Author author;
  final List<Author> authors;
  final Category category;
  final String content;
  final String date_created;
  final String date_modified;
  final String date_published;
  final int id;
  final String image;
  final bool is_editor_recommend;
  final bool is_liyan_article;
  final bool is_published;
  final bool is_replyable;
  final int replies_count;
  final String small_image;
  final Subject subject;
  final String subject_key;
  final String summary;
  final String text;
  final String title;
  final String ukey_author;
  final String video_content;
  Guokenews({
    this.author,
    this.authors,
    this.category,
    this.content,
    this.date_created,
    this.date_modified,
    this.date_published,
    this.id,
    this.image,
    this.is_editor_recommend,
    this.is_liyan_article,
    this.is_published,
    this.is_replyable,
    this.replies_count,
    this.small_image,
    this.subject,
    this.subject_key,
    this.summary,
    this.text,
    this.title,
    this.ukey_author,
    this.video_content,
  });
 

  Guokenews copyWith({
    Author author,
    List<Author> authors,
    Category category,
    String content,
    String date_created,
    String date_modified,
    String date_published,
    int id,
    String image,
    bool is_editor_recommend,
    bool is_liyan_article,
    bool is_published,
    bool is_replyable,
    int replies_count,
    String small_image,
    Subject subject,
    String subject_key,
    String summary,
    String text,
    String title,
    String ukey_author,
    String video_content,
  }) {
    return Guokenews(
      author: author ?? this.author,
      authors: authors ?? this.authors,
      category: category ?? this.category,
      content: content ?? this.content,
      date_created: date_created ?? this.date_created,
      date_modified: date_modified ?? this.date_modified,
      date_published: date_published ?? this.date_published,
      id: id ?? this.id,
      image: image ?? this.image,
      is_editor_recommend: is_editor_recommend ?? this.is_editor_recommend,
      is_liyan_article: is_liyan_article ?? this.is_liyan_article,
      is_published: is_published ?? this.is_published,
      is_replyable: is_replyable ?? this.is_replyable,
      replies_count: replies_count ?? this.replies_count,
      small_image: small_image ?? this.small_image,
      subject: subject ?? this.subject,
      subject_key: subject_key ?? this.subject_key,
      summary: summary ?? this.summary,
      text: text ?? this.text,
      title: title ?? this.title,
      ukey_author: ukey_author ?? this.ukey_author,
      video_content: video_content ?? this.video_content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author?.toMap(),
      'authors': authors?.map((x) => x?.toMap())?.toList(),
      'category': category?.toMap(),
      'content': content,
      'date_created': date_created,
      'date_modified': date_modified,
      'date_published': date_published,
      'id': id,
      'image': image,
      'is_editor_recommend': is_editor_recommend,
      'is_liyan_article': is_liyan_article,
      'is_published': is_published,
      'is_replyable': is_replyable,
      'replies_count': replies_count,
      'small_image': small_image,
      'subject': subject?.toMap(),
      'subject_key': subject_key,
      'summary': summary,
      'text': text,
      'title': title,
      'ukey_author': ukey_author,
      'video_content': video_content,
    };
  }

  static Guokenews fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Guokenews(
      author: Author.fromMap(map['author']),
      authors: List<Author>.from(map['authors']?.map((x) => Author.fromMap(x))),
      category: Category.fromMap(map['category']),
      content: map['content'],
      date_created: map['date_created'],
      date_modified: map['date_modified'],
      date_published: map['date_published'],
      id: map['id'],
      image: map['image'],
      is_editor_recommend: map['is_editor_recommend'],
      is_liyan_article: map['is_liyan_article'],
      is_published: map['is_published'],
      is_replyable: map['is_replyable'],
      replies_count: map['replies_count'],
      small_image: map['small_image'],
      subject: Subject.fromMap(map['subject']),
      subject_key: map['subject_key'],
      summary: map['summary'],
      text: map['text'],
      title: map['title'],
      ukey_author: map['ukey_author'],
      video_content: map['video_content'],
    );
  }

  String toJson() => json.encode(toMap());

  static Guokenews fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Guokenews(author: $author, authors: $authors, category: $category, content: $content, date_created: $date_created, date_modified: $date_modified, date_published: $date_published, id: $id, image: $image, is_editor_recommend: $is_editor_recommend, is_liyan_article: $is_liyan_article, is_published: $is_published, is_replyable: $is_replyable, replies_count: $replies_count, small_image: $small_image, subject: $subject, subject_key: $subject_key, summary: $summary, text: $text, title: $title, ukey_author: $ukey_author, video_content: $video_content)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return o is Guokenews &&
      o.author == author &&
      listEquals(o.authors, authors) &&
      o.category == category &&
      o.content == content &&
      o.date_created == date_created &&
      o.date_modified == date_modified &&
      o.date_published == date_published &&
      o.id == id &&
      o.image == image &&
      o.is_editor_recommend == is_editor_recommend &&
      o.is_liyan_article == is_liyan_article &&
      o.is_published == is_published &&
      o.is_replyable == is_replyable &&
      o.replies_count == replies_count &&
      o.small_image == small_image &&
      o.subject == subject &&
      o.subject_key == subject_key &&
      o.summary == summary &&
      o.text == text &&
      o.title == title &&
      o.ukey_author == ukey_author &&
      o.video_content == video_content;
  }

  @override
  int get hashCode {
    return author.hashCode ^
      authors.hashCode ^
      category.hashCode ^
      content.hashCode ^
      date_created.hashCode ^
      date_modified.hashCode ^
      date_published.hashCode ^
      id.hashCode ^
      image.hashCode ^
      is_editor_recommend.hashCode ^
      is_liyan_article.hashCode ^
      is_published.hashCode ^
      is_replyable.hashCode ^
      replies_count.hashCode ^
      small_image.hashCode ^
      subject.hashCode ^
      subject_key.hashCode ^
      summary.hashCode ^
      text.hashCode ^
      title.hashCode ^
      ukey_author.hashCode ^
      video_content.hashCode;
  }
}
