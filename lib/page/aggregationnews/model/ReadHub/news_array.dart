import 'dart:convert';

class NewsArray {
  final int id;
  final String url;
  final String title;
  final String siteName;
  final String mobileUrl;
  final String autherName;
  final int duplicateId;
  final String publishDate;
  final String language;
  final int statementType;
  NewsArray({
    this.id,
    this.url,
    this.title,
    this.siteName,
    this.mobileUrl,
    this.autherName,
    this.duplicateId,
    this.publishDate,
    this.language,
    this.statementType,
  });

  NewsArray copyWith({
    int id,
    String url,
    String title,
    String siteName,
    String mobileUrl,
    String autherName,
    int duplicateId,
    String publishDate,
    String language,
    int statementType,
  }) {
    return NewsArray(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      siteName: siteName ?? this.siteName,
      mobileUrl: mobileUrl ?? this.mobileUrl,
      autherName: autherName ?? this.autherName,
      duplicateId: duplicateId ?? this.duplicateId,
      publishDate: publishDate ?? this.publishDate,
      language: language ?? this.language,
      statementType: statementType ?? this.statementType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'title': title,
      'siteName': siteName,
      'mobileUrl': mobileUrl,
      'autherName': autherName,
      'duplicateId': duplicateId,
      'publishDate': publishDate,
      'language': language,
      'statementType': statementType,
    };
  }

  static NewsArray fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return NewsArray(
      id: map['id']?.toInt(),
      url: map['url'],
      title: map['title'],
      siteName: map['siteName'],
      mobileUrl: map['mobileUrl'],
      autherName: map['autherName'],
      duplicateId: map['duplicateId']?.toInt(),
      publishDate: map['publishDate'],
      language: map['language'],
      statementType: map['statementType']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static NewsArray fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsArray(id: $id, url: $url, title: $title, siteName: $siteName, mobileUrl: $mobileUrl, autherName: $autherName, duplicateId: $duplicateId, publishDate: $publishDate, language: $language, statementType: $statementType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is NewsArray &&
      o.id == id &&
      o.url == url &&
      o.title == title &&
      o.siteName == siteName &&
      o.mobileUrl == mobileUrl &&
      o.autherName == autherName &&
      o.duplicateId == duplicateId &&
      o.publishDate == publishDate &&
      o.language == language &&
      o.statementType == statementType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      url.hashCode ^
      title.hashCode ^
      siteName.hashCode ^
      mobileUrl.hashCode ^
      autherName.hashCode ^
      duplicateId.hashCode ^
      publishDate.hashCode ^
      language.hashCode ^
      statementType.hashCode;
  }
}