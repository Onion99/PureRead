import 'dart:convert';

class GuokeNewDetail {
  final String now;
  final bool ok;
  final Result result;
  GuokeNewDetail({
    this.now,
    this.ok,
    this.result,
  });

  GuokeNewDetail copyWith({
    String now,
    bool ok,
    Result result,
  }) {
    return GuokeNewDetail(
      now: now ?? this.now,
      ok: ok ?? this.ok,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'now': now,
      'ok': ok,
      'result': result?.toMap(),
    };
  }

  static GuokeNewDetail fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return GuokeNewDetail(
      now: map['now'],
      ok: map['ok'],
      result: Result.fromMap(map['result']),
    );
  }

  String toJson() => json.encode(toMap());

  static GuokeNewDetail fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'GuokeNewDetail(now: $now, ok: $ok, result: $result)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is GuokeNewDetail &&
      o.now == now &&
      o.ok == ok &&
      o.result == result;
  }

  @override
  int get hashCode => now.hashCode ^ ok.hashCode ^ result.hashCode;
}

class Result {
  final String image;
  final bool is_replyable;
  final List<Channel> channels;
  final List<String> channel_keys;
  final String preface;
  final int id;
  final Subject subject;
  final Category category;
  final bool is_editor_recommend;
  final String copyright;
  final Author author;
  final String image_description;
  final Thumb_image thumb_image;
  final String content;
  final bool is_show_summary;
  final Minisite_key minisite_key;
  final Image_info image_info;
  final String subject_key;
  final Minisite minisite;
  final List<dynamic> tags;
  final String date_published;
  final String video_content;
  final List<Author> authors;
  final int replies_count;
  final bool is_author_external;
  final int recommends_count;
  final String title_hide;
  final External_author external_author;
  final String date_modified;
  final String url;
  final String title;
  final String small_image;
  final String summary;
  final bool is_liyan_article;
  final Ukey_author ukey_author;
  final String date_created;
  final String resource_url;
  Result({
    this.image,
    this.is_replyable,
    this.channels,
    this.channel_keys,
    this.preface,
    this.id,
    this.subject,
    this.category,
    this.is_editor_recommend,
    this.copyright,
    this.author,
    this.image_description,
    this.thumb_image,
    this.content,
    this.is_show_summary,
    this.minisite_key,
    this.image_info,
    this.subject_key,
    this.minisite,
    this.tags,
    this.date_published,
    this.video_content,
    this.authors,
    this.replies_count,
    this.is_author_external,
    this.recommends_count,
    this.title_hide,
    this.external_author,
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

  Result copyWith({
    String image,
    bool is_replyable,
    List<Channel> channels,
    List<String> channel_keys,
    String preface,
    int id,
    Subject subject,
    Category category,
    bool is_editor_recommend,
    String copyright,
    Author author,
    String image_description,
    Thumb_image thumb_image,
    String content,
    bool is_show_summary,
    Minisite_key minisite_key,
    Image_info image_info,
    String subject_key,
    Minisite minisite,
    List<dynamic> tags,
    String date_published,
    String video_content,
    List<Author> authors,
    int replies_count,
    bool is_author_external,
    int recommends_count,
    String title_hide,
    External_author external_author,
    String date_modified,
    String url,
    String title,
    String small_image,
    String summary,
    bool is_liyan_article,
    Ukey_author ukey_author,
    String date_created,
    String resource_url,
  }) {
    return Result(
      image: image ?? this.image,
      is_replyable: is_replyable ?? this.is_replyable,
      channels: channels ?? this.channels,
      channel_keys: channel_keys ?? this.channel_keys,
      preface: preface ?? this.preface,
      id: id ?? this.id,
      subject: subject ?? this.subject,
      category: category ?? this.category,
      is_editor_recommend: is_editor_recommend ?? this.is_editor_recommend,
      copyright: copyright ?? this.copyright,
      author: author ?? this.author,
      image_description: image_description ?? this.image_description,
      thumb_image: thumb_image ?? this.thumb_image,
      content: content ?? this.content,
      is_show_summary: is_show_summary ?? this.is_show_summary,
      minisite_key: minisite_key ?? this.minisite_key,
      image_info: image_info ?? this.image_info,
      subject_key: subject_key ?? this.subject_key,
      minisite: minisite ?? this.minisite,
      tags: tags ?? this.tags,
      date_published: date_published ?? this.date_published,
      video_content: video_content ?? this.video_content,
      authors: authors ?? this.authors,
      replies_count: replies_count ?? this.replies_count,
      is_author_external: is_author_external ?? this.is_author_external,
      recommends_count: recommends_count ?? this.recommends_count,
      title_hide: title_hide ?? this.title_hide,
      external_author: external_author ?? this.external_author,
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
      'channels': channels?.map((x) => x?.toMap())?.toList(),
      'channel_keys': channel_keys,
      'preface': preface,
      'id': id,
      'subject': subject?.toMap(),
      'category': category?.toMap(),
      'is_editor_recommend': is_editor_recommend,
      'copyright': copyright,
      'author': author?.toMap(),
      'image_description': image_description,
      'content': content,
      'is_show_summary': is_show_summary,
      'image_info': image_info?.toMap(),
      'subject_key': subject_key,
      'tags': tags,
      'date_published': date_published,
      'video_content': video_content,
      'authors': authors?.map((x) => x?.toMap())?.toList(),
      'replies_count': replies_count,
      'is_author_external': is_author_external,
      'recommends_count': recommends_count,
      'title_hide': title_hide,
      'external_author': external_author?.toMap(),
      'date_modified': date_modified,
      'url': url,
      'title': title,
      'small_image': small_image,
      'summary': summary,
      'is_liyan_article': is_liyan_article,
      'date_created': date_created,
      'resource_url': resource_url,
    };
  }

  static Result fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Result(
      image: map['image'],
      is_replyable: map['is_replyable'],
      channels: List<Channel>.from(map['channels']?.map((x) => Channel.fromMap(x))),
      channel_keys: List<String>.from(map['channel_keys']),
      preface: map['preface'],
      id: map['id']?.toInt(),
      subject: Subject.fromMap(map['subject']),
      category: Category.fromMap(map['category']),
      is_editor_recommend: map['is_editor_recommend'],
      copyright: map['copyright'],
      author: Author.fromMap(map['author']),
      image_description: map['image_description'],
      content: map['content'],
      is_show_summary: map['is_show_summary'],
      image_info: Image_info.fromMap(map['image_info']),
      subject_key: map['subject_key'],
      tags: List<dynamic>.from(map['tags']),
      date_published: map['date_published'],
      video_content: map['video_content'],
      authors: List<Author>.from(map['authors']?.map((x) => Author.fromMap(x))),
      replies_count: map['replies_count']?.toInt(),
      is_author_external: map['is_author_external'],
      recommends_count: map['recommends_count']?.toInt(),
      title_hide: map['title_hide'],
      external_author: External_author.fromMap(map['external_author']),
      date_modified: map['date_modified'],
      url: map['url'],
      title: map['title'],
      small_image: map['small_image'],
      summary: map['summary'],
      is_liyan_article: map['is_liyan_article'],
      date_created: map['date_created'],
      resource_url: map['resource_url'],
    );
  }

  String toJson() => json.encode(toMap());

  static Result fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(image: $image, is_replyable: $is_replyable, channels: $channels, channel_keys: $channel_keys, preface: $preface, id: $id, subject: $subject, category: $category, is_editor_recommend: $is_editor_recommend, copyright: $copyright, author: $author, image_description: $image_description, thumb_image: $thumb_image, content: $content, is_show_summary: $is_show_summary, minisite_key: $minisite_key, image_info: $image_info, subject_key: $subject_key, minisite: $minisite, tags: $tags, date_published: $date_published, video_content: $video_content, authors: $authors, replies_count: $replies_count, is_author_external: $is_author_external, recommends_count: $recommends_count, title_hide: $title_hide, external_author: $external_author, date_modified: $date_modified, url: $url, title: $title, small_image: $small_image, summary: $summary, is_liyan_article: $is_liyan_article, ukey_author: $ukey_author, date_created: $date_created, resource_url: $resource_url)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Result &&
      o.image == image &&
      o.is_replyable == is_replyable &&
      o.preface == preface &&
      o.id == id &&
      o.subject == subject &&
      o.category == category &&
      o.is_editor_recommend == is_editor_recommend &&
      o.copyright == copyright &&
      o.author == author &&
      o.image_description == image_description &&
      o.thumb_image == thumb_image &&
      o.content == content &&
      o.is_show_summary == is_show_summary &&
      o.minisite_key == minisite_key &&
      o.image_info == image_info &&
      o.subject_key == subject_key &&
      o.minisite == minisite &&
      o.date_published == date_published &&
      o.video_content == video_content &&
      o.replies_count == replies_count &&
      o.is_author_external == is_author_external &&
      o.recommends_count == recommends_count &&
      o.title_hide == title_hide &&
      o.external_author == external_author &&
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
      channels.hashCode ^
      channel_keys.hashCode ^
      preface.hashCode ^
      id.hashCode ^
      subject.hashCode ^
      category.hashCode ^
      is_editor_recommend.hashCode ^
      copyright.hashCode ^
      author.hashCode ^
      image_description.hashCode ^
      thumb_image.hashCode ^
      content.hashCode ^
      is_show_summary.hashCode ^
      minisite_key.hashCode ^
      image_info.hashCode ^
      subject_key.hashCode ^
      minisite.hashCode ^
      tags.hashCode ^
      date_published.hashCode ^
      video_content.hashCode ^
      authors.hashCode ^
      replies_count.hashCode ^
      is_author_external.hashCode ^
      recommends_count.hashCode ^
      title_hide.hashCode ^
      external_author.hashCode ^
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

class Channel {
  final String url;
  final String date_created;
  final String name;
  final String key;
  final int articles_count;
  Channel({
    this.url,
    this.date_created,
    this.name,
    this.key,
    this.articles_count,
  });

  Channel copyWith({
    String url,
    String date_created,
    String name,
    String key,
    int articles_count,
  }) {
    return Channel(
      url: url ?? this.url,
      date_created: date_created ?? this.date_created,
      name: name ?? this.name,
      key: key ?? this.key,
      articles_count: articles_count ?? this.articles_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'date_created': date_created,
      'name': name,
      'key': key,
      'articles_count': articles_count,
    };
  }

  static Channel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Channel(
      url: map['url'],
      date_created: map['date_created'],
      name: map['name'],
      key: map['key'],
      articles_count: map['articles_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Channel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Channel(url: $url, date_created: $date_created, name: $name, key: $key, articles_count: $articles_count)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Channel &&
      o.url == url &&
      o.date_created == date_created &&
      o.name == name &&
      o.key == key &&
      o.articles_count == articles_count;
  }

  @override
  int get hashCode {
    return url.hashCode ^
      date_created.hashCode ^
      name.hashCode ^
      key.hashCode ^
      articles_count.hashCode;
  }
}

class Subject {
  final String url;
  final String date_created;
  final String name;
  final String key;
  final int articles_count;
  Subject({
    this.url,
    this.date_created,
    this.name,
    this.key,
    this.articles_count,
  });

  Subject copyWith({
    String url,
    String date_created,
    String name,
    String key,
    int articles_count,
  }) {
    return Subject(
      url: url ?? this.url,
      date_created: date_created ?? this.date_created,
      name: name ?? this.name,
      key: key ?? this.key,
      articles_count: articles_count ?? this.articles_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'date_created': date_created,
      'name': name,
      'key': key,
      'articles_count': articles_count,
    };
  }

  static Subject fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Subject(
      url: map['url'],
      date_created: map['date_created'],
      name: map['name'],
      key: map['key'],
      articles_count: map['articles_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Subject fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Subject(url: $url, date_created: $date_created, name: $name, key: $key, articles_count: $articles_count)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Subject &&
      o.url == url &&
      o.date_created == date_created &&
      o.name == name &&
      o.key == key &&
      o.articles_count == articles_count;
  }

  @override
  int get hashCode {
    return url.hashCode ^
      date_created.hashCode ^
      name.hashCode ^
      key.hashCode ^
      articles_count.hashCode;
  }
}

class Category {
  final int sort_score;
  final String name;
  final String key;
  final String date_created;
  final int id;
  final int articles_count;
  Category({
    this.sort_score,
    this.name,
    this.key,
    this.date_created,
    this.id,
    this.articles_count,
  });

  Category copyWith({
    int sort_score,
    String name,
    String key,
    String date_created,
    int id,
    int articles_count,
  }) {
    return Category(
      sort_score: sort_score ?? this.sort_score,
      name: name ?? this.name,
      key: key ?? this.key,
      date_created: date_created ?? this.date_created,
      id: id ?? this.id,
      articles_count: articles_count ?? this.articles_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sort_score': sort_score,
      'name': name,
      'key': key,
      'date_created': date_created,
      'id': id,
      'articles_count': articles_count,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Category(
      sort_score: map['sort_score']?.toInt(),
      name: map['name'],
      key: map['key'],
      date_created: map['date_created'],
      id: map['id']?.toInt(),
      articles_count: map['articles_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Category fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(sort_score: $sort_score, name: $name, key: $key, date_created: $date_created, id: $id, articles_count: $articles_count)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Category &&
      o.sort_score == sort_score &&
      o.name == name &&
      o.key == key &&
      o.date_created == date_created &&
      o.id == id &&
      o.articles_count == articles_count;
  }

  @override
  int get hashCode {
    return sort_score.hashCode ^
      name.hashCode ^
      key.hashCode ^
      date_created.hashCode ^
      id.hashCode ^
      articles_count.hashCode;
  }
}

class Author {
  final String url;
  final String introduction;
  final String nickname;
  final Avatar avatar;
  Author({
    this.url,
    this.introduction,
    this.nickname,
    this.avatar,
  });

  Author copyWith({
    String url,
    String introduction,
    String nickname,
    Avatar avatar,
  }) {
    return Author(
      url: url ?? this.url,
      introduction: introduction ?? this.introduction,
      nickname: nickname ?? this.nickname,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'introduction': introduction,
      'nickname': nickname,
      'avatar': avatar?.toMap(),
    };
  }

  static Author fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Author(
      url: map['url'],
      introduction: map['introduction'],
      nickname: map['nickname'],
    );
  }

  String toJson() => json.encode(toMap());

  static Author fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Author(url: $url, introduction: $introduction, nickname: $nickname, avatar: $avatar)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Author &&
      o.url == url &&
      o.introduction == introduction &&
      o.nickname == nickname &&
      o.avatar == avatar;
  }

  @override
  int get hashCode {
    return url.hashCode ^
      introduction.hashCode ^
      nickname.hashCode ^
      avatar.hashCode;
  }
}

class Avatar {
  final String small;
  final String large;
  final String normal;
  Avatar({
    this.small,
    this.large,
    this.normal,
  });

  Avatar copyWith({
    String small,
    String large,
    String normal,
  }) {
    return Avatar(
      small: small ?? this.small,
      large: large ?? this.large,
      normal: normal ?? this.normal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'large': large,
      'normal': normal,
    };
  }

  static Avatar fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Avatar(
      small: map['small'],
      large: map['large'],
      normal: map['normal'],
    );
  }

  String toJson() => json.encode(toMap());

  static Avatar fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Avatar(small: $small, large: $large, normal: $normal)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Avatar &&
      o.small == small &&
      o.large == large &&
      o.normal == normal;
  }

  @override
  int get hashCode => small.hashCode ^ large.hashCode ^ normal.hashCode;
}

class Thumb_image {
}

class Minisite_key {
}

class Image_info {
  final String url;
  final int width;
  final int height;
  Image_info({
    this.url,
    this.width,
    this.height,
  });

  Image_info copyWith({
    String url,
    int width,
    int height,
  }) {
    return Image_info(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'width': width,
      'height': height,
    };
  }

  static Image_info fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Image_info(
      url: map['url'],
      width: map['width']?.toInt(),
      height: map['height']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Image_info fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Image_info(url: $url, width: $width, height: $height)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Image_info &&
      o.url == url &&
      o.width == width &&
      o.height == height;
  }

  @override
  int get hashCode => url.hashCode ^ width.hashCode ^ height.hashCode;
}

class Minisite {
}

class Ukey_author {
}

class External_author {
  final String url;
  final String introduction;
  final String nickname;
  final Avatar avatar;
  External_author({
    this.url,
    this.introduction,
    this.nickname,
    this.avatar,
  });

  External_author copyWith({
    String url,
    String introduction,
    String nickname,
    Avatar avatar,
  }) {
    return External_author(
      url: url ?? this.url,
      introduction: introduction ?? this.introduction,
      nickname: nickname ?? this.nickname,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'introduction': introduction,
      'nickname': nickname,
      'avatar': avatar?.toMap(),
    };
  }

  static External_author fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return External_author(
      url: map['url'],
      introduction: map['introduction'],
      nickname: map['nickname'],
      avatar: Avatar.fromMap(map['avatar']),
    );
  }

  String toJson() => json.encode(toMap());

  static External_author fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'External_author(url: $url, introduction: $introduction, nickname: $nickname, avatar: $avatar)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is External_author &&
      o.url == url &&
      o.introduction == introduction &&
      o.nickname == nickname &&
      o.avatar == avatar;
  }

  @override
  int get hashCode {
    return url.hashCode ^
      introduction.hashCode ^
      nickname.hashCode ^
      avatar.hashCode;
  }
}