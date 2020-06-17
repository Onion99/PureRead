import 'dart:convert';

class GuokeDay {
  final String image;
  final bool is_replyable;
  final String preface;
  final int id;
  final bool is_editor_recommend;
  final String copyright;
  final String image_description;
  final bool is_show_summary;
  final String minisite_key;
  final String subject_key;
  final String date_published;
  final String video_content;
  final int replies_count;
  final bool is_author_external;
  final int recommends_count;
  final String title_hide;
  final String date_modified;
  final String url;
  final String title;
    final String small_image;
  final String summary;
  final bool is_liyan_article;
  final String ukey_author;
  final String date_created;
  final String resource_url;
  GuokeDay({
    this.image,
    this.is_replyable,
    this.preface,
    this.id,
    this.is_editor_recommend,
    this.copyright,
    this.image_description,
    this.is_show_summary,
    this.minisite_key,
    this.subject_key,
    this.date_published,
    this.video_content,
    this.replies_count,
    this.is_author_external,
    this.recommends_count,
    this.title_hide,
    this.date_modified,
    this.url,
    this.title,
    this.small_image,
    this.summary,
    this.is_liyan_article,
    this.ukey_author,
    this.date_created,
    this.resource_url,
  });


  GuokeDay copyWith({
    String image,
    bool is_replyable,
    String preface,
    int id,
    bool is_editor_recommend,
    String copyright,
    String image_description,
    bool is_show_summary,
    String minisite_key,
    String subject_key,
    String date_published,
    String video_content,
    int replies_count,
    bool is_author_external,
    int recommends_count,
    String title_hide,
    String date_modified,
    String url,
    String title,
    String small_image,
    String summary,
    bool is_liyan_article,
    String ukey_author,
    String date_created,
    String resource_url,
  }) {
    return GuokeDay(
      image: image ?? this.image,
      is_replyable: is_replyable ?? this.is_replyable,
      preface: preface ?? this.preface,
      id: id ?? this.id,
      is_editor_recommend: is_editor_recommend ?? this.is_editor_recommend,
      copyright: copyright ?? this.copyright,
      image_description: image_description ?? this.image_description,
      is_show_summary: is_show_summary ?? this.is_show_summary,
      minisite_key: minisite_key ?? this.minisite_key,
      subject_key: subject_key ?? this.subject_key,
      date_published: date_published ?? this.date_published,
      video_content: video_content ?? this.video_content,
      replies_count: replies_count ?? this.replies_count,
      is_author_external: is_author_external ?? this.is_author_external,
      recommends_count: recommends_count ?? this.recommends_count,
      title_hide: title_hide ?? this.title_hide,
      date_modified: date_modified ?? this.date_modified,
      url: url ?? this.url,
      title: title ?? this.title,
      small_image: small_image ?? this.small_image,
      summary: summary ?? this.summary,
      is_liyan_article: is_liyan_article ?? this.is_liyan_article,
      ukey_author: ukey_author ?? this.ukey_author,
      date_created: date_created ?? this.date_created,
      resource_url: resource_url ?? this.resource_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'is_replyable': is_replyable,
      'preface': preface,
      'id': id,
      'is_editor_recommend': is_editor_recommend,
      'copyright': copyright,
      'image_description': image_description,
      'is_show_summary': is_show_summary,
      'minisite_key': minisite_key,
      'subject_key': subject_key,
      'date_published': date_published,
      'video_content': video_content,
      'replies_count': replies_count,
      'is_author_external': is_author_external,
      'recommends_count': recommends_count,
      'title_hide': title_hide,
      'date_modified': date_modified,
      'url': url,
      'title': title,
      'small_image': small_image,
      'summary': summary,
      'is_liyan_article': is_liyan_article,
      'ukey_author': ukey_author,
      'date_created': date_created,
      'resource_url': resource_url,
    };
  }

  static GuokeDay fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GuokeDay(
      image: map['image'],
      is_replyable: map['is_replyable'],
      preface: map['preface'],
      id: map['id'],
      is_editor_recommend: map['is_editor_recommend'],
      copyright: map['copyright'],
      image_description: map['image_description'],
      is_show_summary: map['is_show_summary'],
      minisite_key: map['minisite_key'],
      subject_key: map['subject_key'],
      date_published: map['date_published'],
      video_content: map['video_content'],
      replies_count: map['replies_count'],
      is_author_external: map['is_author_external'],
      recommends_count: map['recommends_count'],
      title_hide: map['title_hide'],
      date_modified: map['date_modified'],
      url: map['url'],
      title: map['title'],
      small_image: map['small_image'],
      summary: map['summary'],
      is_liyan_article: map['is_liyan_article'],
      ukey_author: map['ukey_author'],
      date_created: map['date_created'],
      resource_url: map['resource_url'],
    );
  }

  String toJson() => json.encode(toMap());

  static GuokeDay fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'GuokeDay(image: $image, is_replyable: $is_replyable, preface: $preface, id: $id, is_editor_recommend: $is_editor_recommend, copyright: $copyright, image_description: $image_description, is_show_summary: $is_show_summary, minisite_key: $minisite_key, subject_key: $subject_key, date_published: $date_published, video_content: $video_content, replies_count: $replies_count, is_author_external: $is_author_external, recommends_count: $recommends_count, title_hide: $title_hide, date_modified: $date_modified, url: $url, title: $title, small_image: $small_image, summary: $summary, is_liyan_article: $is_liyan_article, ukey_author: $ukey_author, date_created: $date_created, resource_url: $resource_url)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GuokeDay &&
        o.image == image &&
        o.is_replyable == is_replyable &&
        o.preface == preface &&
        o.id == id &&
        o.is_editor_recommend == is_editor_recommend &&
        o.copyright == copyright &&
        o.image_description == image_description &&
        o.is_show_summary == is_show_summary &&
        o.minisite_key == minisite_key &&
        o.subject_key == subject_key &&
        o.date_published == date_published &&
        o.video_content == video_content &&
        o.replies_count == replies_count &&
        o.is_author_external == is_author_external &&
        o.recommends_count == recommends_count &&
        o.title_hide == title_hide &&
        o.date_modified == date_modified &&
        o.url == url &&
        o.title == title &&
        o.small_image == small_image &&
        o.summary == summary &&
        o.is_liyan_article == is_liyan_article &&
        o.ukey_author == ukey_author &&
        o.date_created == date_created &&
        o.resource_url == resource_url;
  }

  @override
  int get hashCode {
    return image.hashCode ^
    is_replyable.hashCode ^
    preface.hashCode ^
    id.hashCode ^
    is_editor_recommend.hashCode ^
    copyright.hashCode ^
    image_description.hashCode ^
    is_show_summary.hashCode ^
    minisite_key.hashCode ^
    subject_key.hashCode ^
    date_published.hashCode ^
    video_content.hashCode ^
    replies_count.hashCode ^
    is_author_external.hashCode ^
    recommends_count.hashCode ^
    title_hide.hashCode ^
    date_modified.hashCode ^
    url.hashCode ^
    title.hashCode ^
    small_image.hashCode ^
    summary.hashCode ^
    is_liyan_article.hashCode ^
    ukey_author.hashCode ^
    date_created.hashCode ^
    resource_url.hashCode;
  }
}
