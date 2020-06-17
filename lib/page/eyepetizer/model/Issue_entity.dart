import 'dart:convert';

import 'package:flutter/foundation.dart';

class IssueEntity {
  final List<IssueList> issueList;
  final String nextPageUrl;
  final int nextPublishTime;
  final String newestIssueType;
  final String dialog;
  IssueEntity({
    this.issueList,
    this.nextPageUrl,
    this.nextPublishTime,
    this.newestIssueType,
    this.dialog,
  });

  IssueEntity copyWith({
    List<IssueList> issueList,
    String nextPageUrl,
    int nextPublishTime,
    String newestIssueType,
    String dialog,
  }) {
    return IssueEntity(
      issueList: issueList ?? this.issueList,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      nextPublishTime: nextPublishTime ?? this.nextPublishTime,
      newestIssueType: newestIssueType ?? this.newestIssueType,
      dialog: dialog ?? this.dialog,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'issueList': issueList?.map((x) => x?.toMap())?.toList(),
      'nextPageUrl': nextPageUrl,
      'nextPublishTime': nextPublishTime,
      'newestIssueType': newestIssueType,
      'dialog': dialog,
    };
  }

  static IssueEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return IssueEntity(
      issueList: List<IssueList>.from(map['issueList']?.map((x) => IssueList.fromMap(x))),
      nextPageUrl: map['nextPageUrl'],
      nextPublishTime: map['nextPublishTime']?.toInt(),
      newestIssueType: map['newestIssueType'],
      dialog: map['dialog'],
    );
  }

  String toJson() => json.encode(toMap());

  static IssueEntity fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'IssueEntity(issueList: $issueList, nextPageUrl: $nextPageUrl, nextPublishTime: $nextPublishTime, newestIssueType: $newestIssueType, dialog: $dialog)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is IssueEntity &&
      listEquals(o.issueList, issueList) &&
      o.nextPageUrl == nextPageUrl &&
      o.nextPublishTime == nextPublishTime &&
      o.newestIssueType == newestIssueType &&
      o.dialog == dialog;
  }

  @override
  int get hashCode {
    return issueList.hashCode ^
      nextPageUrl.hashCode ^
      nextPublishTime.hashCode ^
      newestIssueType.hashCode ^
      dialog.hashCode;
  }
}

class IssueList {
  final int releaseTime;
  final String type;
  final int date;
  final int publishTime;
  final List<ItemList> itemList;
  final int count;
  IssueList({
    this.releaseTime,
    this.type,
    this.date,
    this.publishTime,
    this.itemList,
    this.count,
  });

  IssueList copyWith({
    int releaseTime,
    String type,
    int date,
    int publishTime,
    List<ItemList> itemList,
    int count,
  }) {
    return IssueList(
      releaseTime: releaseTime ?? this.releaseTime,
      type: type ?? this.type,
      date: date ?? this.date,
      publishTime: publishTime ?? this.publishTime,
      itemList: itemList ?? this.itemList,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'releaseTime': releaseTime,
      'type': type,
      'date': date,
      'publishTime': publishTime,
      'itemList': itemList?.map((x) => x?.toMap())?.toList(),
      'count': count,
    };
  }

  static IssueList fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return IssueList(
      releaseTime: map['releaseTime']?.toInt(),
      type: map['type'],
      date: map['date']?.toInt(),
      publishTime: map['publishTime']?.toInt(),
      itemList: List<ItemList>.from(map['itemList']?.map((x) => ItemList.fromMap(x))),
      count: map['count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static IssueList fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'IssueList(releaseTime: $releaseTime, type: $type, date: $date, publishTime: $publishTime, itemList: $itemList, count: $count)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is IssueList &&
      o.releaseTime == releaseTime &&
      o.type == type &&
      o.date == date &&
      o.publishTime == publishTime &&
      listEquals(o.itemList, itemList) &&
      o.count == count;
  }

  @override
  int get hashCode {
    return releaseTime.hashCode ^
      type.hashCode ^
      date.hashCode ^
      publishTime.hashCode ^
      itemList.hashCode ^
      count.hashCode;
  }
}

class ItemList {
  final String type;
  final Data data;
  final String tag;
  final int id;
  final int adIndex;
  ItemList({
    this.type,
    this.data,
    this.tag,
    this.id,
    this.adIndex,
  });

  ItemList copyWith({
    String type,
    Data data,
    String tag,
    int id,
    int adIndex,
  }) {
    return ItemList(
      type: type ?? this.type,
      data: data ?? this.data,
      tag: tag ?? this.tag,
      id: id ?? this.id,
      adIndex: adIndex ?? this.adIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'data': data?.toMap(),
      'tag': tag,
      'id': id,
      'adIndex': adIndex,
    };
  }

  static ItemList fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ItemList(
      type: map['type'],
      data: Data.fromMap(map['data']),
      tag: map['tag'],
      id: map['id']?.toInt(),
      adIndex: map['adIndex']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static ItemList fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemList(type: $type, data: $data, tag: $tag, id: $id, adIndex: $adIndex)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ItemList &&
      o.type == type &&
      o.data == data &&
      o.tag == tag &&
      o.id == id &&
      o.adIndex == adIndex;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      data.hashCode ^
      tag.hashCode ^
      id.hashCode ^
      adIndex.hashCode;
  }
}

class Data {
  final String dataType;
  final String text;
  final int id;
  final String title;
  final String description;
  final String library;
  final List<Tag> tags;
  final Consumption consumption;
  final String resourceType;
  final String slogan;
  final Provider provider;
  final String category;
  final Author author;
  final Cover cover;
  final String playUrl;
  final String thumbPlayUrl;
  final int duration;
  final WebUrl webUrl;
  final int releaseTime;
  final List<dynamic> playInfo;
  final String campaign;
  final String waterMarks;
  final bool ad;
  final List<dynamic> adTrack;
  final String type;
  final String titlePgc;
  final String descriptionPgc;
  final String remark;
  final bool ifLimitVideo;
  final int searchWeight;
  final String brandWebsiteInfo;
  final int idx;
  final String shareAdTrack;
  final String favoriteAdTrack;
  final String webAdTrack;
  final int date;
  final String promotion;
  final String label;
  final List<dynamic> labelList;
  final String descriptionEditor;
  final bool collected;
  final bool reallyCollected;
  final bool played;
  final List<dynamic> subtitles;
  final String lastViewTime;
  final String playlists;
  final String src;
  Data({
    this.dataType,
    this.text,
    this.id,
    this.title,
    this.description,
    this.library,
    this.tags,
    this.consumption,
    this.resourceType,
    this.slogan,
    this.provider,
    this.category,
    this.author,
    this.cover,
    this.playUrl,
    this.thumbPlayUrl,
    this.duration,
    this.webUrl,
    this.releaseTime,
    this.playInfo,
    this.campaign,
    this.waterMarks,
    this.ad,
    this.adTrack,
    this.type,
    this.titlePgc,
    this.descriptionPgc,
    this.remark,
    this.ifLimitVideo,
    this.searchWeight,
    this.brandWebsiteInfo,
    this.idx,
    this.shareAdTrack,
    this.favoriteAdTrack,
    this.webAdTrack,
    this.date,
    this.promotion,
    this.label,
    this.labelList,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
    this.subtitles,
    this.lastViewTime,
    this.playlists,
    this.src,
  });

  Data copyWith({
    String dataType,
    String text,
    int id,
    String title,
    String description,
    String library,
    List<Tag> tags,
    Consumption consumption,
    String resourceType,
    String slogan,
    Provider provider,
    String category,
    Author author,
    Cover cover,
    String playUrl,
    String thumbPlayUrl,
    int duration,
    WebUrl webUrl,
    int releaseTime,
    List<dynamic> playInfo,
    String campaign,
    String waterMarks,
    bool ad,
    List<dynamic> adTrack,
    String type,
    String titlePgc,
    String descriptionPgc,
    String remark,
    bool ifLimitVideo,
    int searchWeight,
    String brandWebsiteInfo,
    int idx,
    String shareAdTrack,
    String favoriteAdTrack,
    String webAdTrack,
    int date,
    String promotion,
    String label,
    List<dynamic> labelList,
    String descriptionEditor,
    bool collected,
    bool reallyCollected,
    bool played,
    List<dynamic> subtitles,
    String lastViewTime,
    String playlists,
    String src,
  }) {
    return Data(
      dataType: dataType ?? this.dataType,
      text: text ?? this.text,
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      library: library ?? this.library,
      tags: tags ?? this.tags,
      consumption: consumption ?? this.consumption,
      resourceType: resourceType ?? this.resourceType,
      slogan: slogan ?? this.slogan,
      provider: provider ?? this.provider,
      category: category ?? this.category,
      author: author ?? this.author,
      cover: cover ?? this.cover,
      playUrl: playUrl ?? this.playUrl,
      thumbPlayUrl: thumbPlayUrl ?? this.thumbPlayUrl,
      duration: duration ?? this.duration,
      webUrl: webUrl ?? this.webUrl,
      releaseTime: releaseTime ?? this.releaseTime,
      playInfo: playInfo ?? this.playInfo,
      campaign: campaign ?? this.campaign,
      waterMarks: waterMarks ?? this.waterMarks,
      ad: ad ?? this.ad,
      adTrack: adTrack ?? this.adTrack,
      type: type ?? this.type,
      titlePgc: titlePgc ?? this.titlePgc,
      descriptionPgc: descriptionPgc ?? this.descriptionPgc,
      remark: remark ?? this.remark,
      ifLimitVideo: ifLimitVideo ?? this.ifLimitVideo,
      searchWeight: searchWeight ?? this.searchWeight,
      brandWebsiteInfo: brandWebsiteInfo ?? this.brandWebsiteInfo,
      idx: idx ?? this.idx,
      shareAdTrack: shareAdTrack ?? this.shareAdTrack,
      favoriteAdTrack: favoriteAdTrack ?? this.favoriteAdTrack,
      webAdTrack: webAdTrack ?? this.webAdTrack,
      date: date ?? this.date,
      promotion: promotion ?? this.promotion,
      label: label ?? this.label,
      labelList: labelList ?? this.labelList,
      descriptionEditor: descriptionEditor ?? this.descriptionEditor,
      collected: collected ?? this.collected,
      reallyCollected: reallyCollected ?? this.reallyCollected,
      played: played ?? this.played,
      subtitles: subtitles ?? this.subtitles,
      lastViewTime: lastViewTime ?? this.lastViewTime,
      playlists: playlists ?? this.playlists,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dataType': dataType,
      'text': text,
      'id': id,
      'title': title,
      'description': description,
      'library': library,
      'tags': tags?.map((x) => x?.toMap())?.toList(),
      'consumption': consumption?.toMap(),
      'resourceType': resourceType,
      'slogan': slogan,
      'provider': provider?.toMap(),
      'category': category,
      'author': author?.toMap(),
      'cover': cover?.toMap(),
      'playUrl': playUrl,
      'thumbPlayUrl': thumbPlayUrl,
      'duration': duration,
      'webUrl': webUrl?.toMap(),
      'releaseTime': releaseTime,
      'playInfo': playInfo,
      'campaign': campaign,
      'waterMarks': waterMarks,
      'ad': ad,
      'adTrack': adTrack,
      'type': type,
      'titlePgc': titlePgc,
      'descriptionPgc': descriptionPgc,
      'remark': remark,
      'ifLimitVideo': ifLimitVideo,
      'searchWeight': searchWeight,
      'brandWebsiteInfo': brandWebsiteInfo,
      'idx': idx,
      'shareAdTrack': shareAdTrack,
      'favoriteAdTrack': favoriteAdTrack,
      'webAdTrack': webAdTrack,
      'date': date,
      'promotion': promotion,
      'label': label,
      'labelList': labelList,
      'descriptionEditor': descriptionEditor,
      'collected': collected,
      'reallyCollected': reallyCollected,
      'played': played,
      'subtitles': subtitles,
      'lastViewTime': lastViewTime,
      'playlists': playlists,
      'src': src,
    };
  }

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Data(
      dataType: map['dataType'],
      text: map['text'],
      id: map['id']?.toInt(),
      title: map['title'],
      description: map['description'],
      library: map['library'],
      consumption: Consumption.fromMap(map['consumption']),
      resourceType: map['resourceType'],
      slogan: map['slogan'],
      provider: Provider.fromMap(map['provider']),
      category: map['category'],
      author: Author.fromMap(map['author']),
      cover: Cover.fromMap(map['cover']),
      playUrl: map['playUrl'],
      thumbPlayUrl: map['thumbPlayUrl'],
      duration: map['duration']?.toInt(),
      webUrl: WebUrl.fromMap(map['webUrl']),
      releaseTime: map['releaseTime']?.toInt(),
      campaign: map['campaign'],
      waterMarks: map['waterMarks'],
      ad: map['ad'],
      type: map['type'],
      titlePgc: map['titlePgc'],
      descriptionPgc: map['descriptionPgc'],
      remark: map['remark'],
      ifLimitVideo: map['ifLimitVideo'],
      searchWeight: map['searchWeight']?.toInt(),
      brandWebsiteInfo: map['brandWebsiteInfo'],
      idx: map['idx']?.toInt(),
      shareAdTrack: map['shareAdTrack'],
      favoriteAdTrack: map['favoriteAdTrack'],
      webAdTrack: map['webAdTrack'],
      date: map['date']?.toInt(),
      promotion: map['promotion'],
      label: map['label'],
      descriptionEditor: map['descriptionEditor'],
      collected: map['collected'],
      reallyCollected: map['reallyCollected'],
      played: map['played'],
      lastViewTime: map['lastViewTime'],
      playlists: map['playlists'],
      src: map['src'],
    );
  }

  String toJson() => json.encode(toMap());

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(dataType: $dataType, id: $id, title: $title, description: $description, library: $library, tags: $tags, consumption: $consumption, resourceType: $resourceType, slogan: $slogan, provider: $provider, category: $category, author: $author, cover: $cover, playUrl: $playUrl, thumbPlayUrl: $thumbPlayUrl, duration: $duration, webUrl: $webUrl, releaseTime: $releaseTime, playInfo: $playInfo, campaign: $campaign, waterMarks: $waterMarks, ad: $ad, adTrack: $adTrack, type: $type, titlePgc: $titlePgc, descriptionPgc: $descriptionPgc, remark: $remark, ifLimitVideo: $ifLimitVideo, searchWeight: $searchWeight, brandWebsiteInfo: $brandWebsiteInfo, idx: $idx, shareAdTrack: $shareAdTrack, favoriteAdTrack: $favoriteAdTrack, webAdTrack: $webAdTrack, date: $date, promotion: $promotion, label: $label, labelList: $labelList, descriptionEditor: $descriptionEditor, collected: $collected, reallyCollected: $reallyCollected, played: $played, subtitles: $subtitles, lastViewTime: $lastViewTime, playlists: $playlists, src: $src)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Data &&
      o.dataType == dataType &&
      o.text == text &&
      o.id == id &&
      o.title == title &&
      o.description == description &&
      o.library == library &&
      listEquals(o.tags, tags) &&
      o.consumption == consumption &&
      o.resourceType == resourceType &&
      o.slogan == slogan &&
      o.provider == provider &&
      o.category == category &&
      o.author == author &&
      o.cover == cover &&
      o.playUrl == playUrl &&
      o.thumbPlayUrl == thumbPlayUrl &&
      o.duration == duration &&
      o.webUrl == webUrl &&
      o.releaseTime == releaseTime &&
      listEquals(o.playInfo, playInfo) &&
      o.campaign == campaign &&
      o.waterMarks == waterMarks &&
      o.ad == ad &&
      listEquals(o.adTrack, adTrack) &&
      o.type == type &&
      o.titlePgc == titlePgc &&
      o.descriptionPgc == descriptionPgc &&
      o.remark == remark &&
      o.ifLimitVideo == ifLimitVideo &&
      o.searchWeight == searchWeight &&
      o.brandWebsiteInfo == brandWebsiteInfo &&
      o.idx == idx &&
      o.shareAdTrack == shareAdTrack &&
      o.favoriteAdTrack == favoriteAdTrack &&
      o.webAdTrack == webAdTrack &&
      o.date == date &&
      o.promotion == promotion &&
      o.label == label &&
      listEquals(o.labelList, labelList) &&
      o.descriptionEditor == descriptionEditor &&
      o.collected == collected &&
      o.reallyCollected == reallyCollected &&
      o.played == played &&
      listEquals(o.subtitles, subtitles) &&
      o.lastViewTime == lastViewTime &&
      o.playlists == playlists &&
      o.src == src;
  }

  @override
  int get hashCode {
    return dataType.hashCode ^ text.hashCode ^
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      library.hashCode ^
      tags.hashCode ^
      consumption.hashCode ^
      resourceType.hashCode ^
      slogan.hashCode ^
      provider.hashCode ^
      category.hashCode ^
      author.hashCode ^
      cover.hashCode ^
      playUrl.hashCode ^
      thumbPlayUrl.hashCode ^
      duration.hashCode ^
      webUrl.hashCode ^
      releaseTime.hashCode ^
      playInfo.hashCode ^
      campaign.hashCode ^
      waterMarks.hashCode ^
      ad.hashCode ^
      adTrack.hashCode ^
      type.hashCode ^
      titlePgc.hashCode ^
      descriptionPgc.hashCode ^
      remark.hashCode ^
      ifLimitVideo.hashCode ^
      searchWeight.hashCode ^
      brandWebsiteInfo.hashCode ^
      idx.hashCode ^
      shareAdTrack.hashCode ^
      favoriteAdTrack.hashCode ^
      webAdTrack.hashCode ^
      date.hashCode ^
      promotion.hashCode ^
      label.hashCode ^
      labelList.hashCode ^
      descriptionEditor.hashCode ^
      collected.hashCode ^
      reallyCollected.hashCode ^
      played.hashCode ^
      subtitles.hashCode ^
      lastViewTime.hashCode ^
      playlists.hashCode ^
      src.hashCode;
  }
}

class Tag {
  final int id;
  final String name;
  final String actionUrl;
  final String adTrack;
  final String desc;
  final String bgPicture;
  final String headerImage;
  final String tagRecType;
  final String childTagList;
  final String childTagIdList;
  final bool haveReward;
  final bool ifNewest;
  final String newestEndTime;
  final int communityIndex;
  Tag({
    this.id,
    this.name,
    this.actionUrl,
    this.adTrack,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.childTagList,
    this.childTagIdList,
    this.haveReward,
    this.ifNewest,
    this.newestEndTime,
    this.communityIndex,
  });

  Tag copyWith({
    int id,
    String name,
    String actionUrl,
    String adTrack,
    String desc,
    String bgPicture,
    String headerImage,
    String tagRecType,
    String childTagList,
    String childTagIdList,
    bool haveReward,
    bool ifNewest,
    String newestEndTime,
    int communityIndex,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      actionUrl: actionUrl ?? this.actionUrl,
      adTrack: adTrack ?? this.adTrack,
      desc: desc ?? this.desc,
      bgPicture: bgPicture ?? this.bgPicture,
      headerImage: headerImage ?? this.headerImage,
      tagRecType: tagRecType ?? this.tagRecType,
      childTagList: childTagList ?? this.childTagList,
      childTagIdList: childTagIdList ?? this.childTagIdList,
      haveReward: haveReward ?? this.haveReward,
      ifNewest: ifNewest ?? this.ifNewest,
      newestEndTime: newestEndTime ?? this.newestEndTime,
      communityIndex: communityIndex ?? this.communityIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'actionUrl': actionUrl,
      'adTrack': adTrack,
      'desc': desc,
      'bgPicture': bgPicture,
      'headerImage': headerImage,
      'tagRecType': tagRecType,
      'childTagList': childTagList,
      'childTagIdList': childTagIdList,
      'haveReward': haveReward,
      'ifNewest': ifNewest,
      'newestEndTime': newestEndTime,
      'communityIndex': communityIndex,
    };
  }

  static Tag fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Tag(
      id: map['id']?.toInt(),
      name: map['name'],
      actionUrl: map['actionUrl'],
      adTrack: map['adTrack'],
      desc: map['desc'],
      bgPicture: map['bgPicture'],
      headerImage: map['headerImage'],
      tagRecType: map['tagRecType'],
      childTagList: map['childTagList'],
      childTagIdList: map['childTagIdList'],
      haveReward: map['haveReward'],
      ifNewest: map['ifNewest'],
      newestEndTime: map['newestEndTime'],
      communityIndex: map['communityIndex']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Tag fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, actionUrl: $actionUrl, adTrack: $adTrack, desc: $desc, bgPicture: $bgPicture, headerImage: $headerImage, tagRecType: $tagRecType, childTagList: $childTagList, childTagIdList: $childTagIdList, haveReward: $haveReward, ifNewest: $ifNewest, newestEndTime: $newestEndTime, communityIndex: $communityIndex)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Tag &&
      o.id == id &&
      o.name == name &&
      o.actionUrl == actionUrl &&
      o.adTrack == adTrack &&
      o.desc == desc &&
      o.bgPicture == bgPicture &&
      o.headerImage == headerImage &&
      o.tagRecType == tagRecType &&
      o.childTagList == childTagList &&
      o.childTagIdList == childTagIdList &&
      o.haveReward == haveReward &&
      o.ifNewest == ifNewest &&
      o.newestEndTime == newestEndTime &&
      o.communityIndex == communityIndex;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      actionUrl.hashCode ^
      adTrack.hashCode ^
      desc.hashCode ^
      bgPicture.hashCode ^
      headerImage.hashCode ^
      tagRecType.hashCode ^
      childTagList.hashCode ^
      childTagIdList.hashCode ^
      haveReward.hashCode ^
      ifNewest.hashCode ^
      newestEndTime.hashCode ^
      communityIndex.hashCode;
  }
}

class Consumption {
  final int collectionCount;
  final int shareCount;
  final int replyCount;
  final int realCollectionCount;
  Consumption({
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
  });

  Consumption copyWith({
    int collectionCount,
    int shareCount,
    int replyCount,
    int realCollectionCount,
  }) {
    return Consumption(
      collectionCount: collectionCount ?? this.collectionCount,
      shareCount: shareCount ?? this.shareCount,
      replyCount: replyCount ?? this.replyCount,
      realCollectionCount: realCollectionCount ?? this.realCollectionCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'collectionCount': collectionCount,
      'shareCount': shareCount,
      'replyCount': replyCount,
      'realCollectionCount': realCollectionCount,
    };
  }

  static Consumption fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Consumption(
      collectionCount: map['collectionCount']?.toInt(),
      shareCount: map['shareCount']?.toInt(),
      replyCount: map['replyCount']?.toInt(),
      realCollectionCount: map['realCollectionCount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Consumption fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Consumption(collectionCount: $collectionCount, shareCount: $shareCount, replyCount: $replyCount, realCollectionCount: $realCollectionCount)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Consumption &&
      o.collectionCount == collectionCount &&
      o.shareCount == shareCount &&
      o.replyCount == replyCount &&
      o.realCollectionCount == realCollectionCount;
  }

  @override
  int get hashCode {
    return collectionCount.hashCode ^
      shareCount.hashCode ^
      replyCount.hashCode ^
      realCollectionCount.hashCode;
  }
}

class Provider {
  final String name;
  final String alias;
  final String icon;
  Provider({
    this.name,
    this.alias,
    this.icon,
  });

  Provider copyWith({
    String name,
    String alias,
    String icon,
  }) {
    return Provider(
      name: name ?? this.name,
      alias: alias ?? this.alias,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'alias': alias,
      'icon': icon,
    };
  }

  static Provider fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Provider(
      name: map['name'],
      alias: map['alias'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  static Provider fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Provider(name: $name, alias: $alias, icon: $icon)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Provider &&
      o.name == name &&
      o.alias == alias &&
      o.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ alias.hashCode ^ icon.hashCode;
}

class Author {
  final int id;
  final String icon;
  final String name;
  final String description;
  final String link;
  final int latestReleaseTime;
  final int videoNum;
  final String adTrack;
  final Follow follow;
  final Shield shield;
  final int approvedNotReadyVideoCount;
  final bool ifPgc;
  final int recSort;
  final bool expert;
  Author({
    this.id,
    this.icon,
    this.name,
    this.description,
    this.link,
    this.latestReleaseTime,
    this.videoNum,
    this.adTrack,
    this.follow,
    this.shield,
    this.approvedNotReadyVideoCount,
    this.ifPgc,
    this.recSort,
    this.expert,
  });

  Author copyWith({
    int id,
    String icon,
    String name,
    String description,
    String link,
    int latestReleaseTime,
    int videoNum,
    String adTrack,
    Follow follow,
    Shield shield,
    int approvedNotReadyVideoCount,
    bool ifPgc,
    int recSort,
    bool expert,
  }) {
    return Author(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      description: description ?? this.description,
      link: link ?? this.link,
      latestReleaseTime: latestReleaseTime ?? this.latestReleaseTime,
      videoNum: videoNum ?? this.videoNum,
      adTrack: adTrack ?? this.adTrack,
      follow: follow ?? this.follow,
      shield: shield ?? this.shield,
      approvedNotReadyVideoCount: approvedNotReadyVideoCount ?? this.approvedNotReadyVideoCount,
      ifPgc: ifPgc ?? this.ifPgc,
      recSort: recSort ?? this.recSort,
      expert: expert ?? this.expert,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icon': icon,
      'name': name,
      'description': description,
      'link': link,
      'latestReleaseTime': latestReleaseTime,
      'videoNum': videoNum,
      'adTrack': adTrack,
      'follow': follow?.toMap(),
      'shield': shield?.toMap(),
      'approvedNotReadyVideoCount': approvedNotReadyVideoCount,
      'ifPgc': ifPgc,
      'recSort': recSort,
      'expert': expert,
    };
  }

  static Author fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Author(
      id: map['id']?.toInt(),
      icon: map['icon'],
      name: map['name'],
      description: map['description'],
      link: map['link'],
      latestReleaseTime: map['latestReleaseTime']?.toInt(),
      videoNum: map['videoNum']?.toInt(),
      adTrack: map['adTrack'],
      follow: Follow.fromMap(map['follow']),
      shield: Shield.fromMap(map['shield']),
      approvedNotReadyVideoCount: map['approvedNotReadyVideoCount']?.toInt(),
      ifPgc: map['ifPgc'],
      recSort: map['recSort']?.toInt(),
      expert: map['expert'],
    );
  }

  String toJson() => json.encode(toMap());

  static Author fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Author(id: $id, icon: $icon, name: $name, description: $description, link: $link, latestReleaseTime: $latestReleaseTime, videoNum: $videoNum, adTrack: $adTrack, follow: $follow, shield: $shield, approvedNotReadyVideoCount: $approvedNotReadyVideoCount, ifPgc: $ifPgc, recSort: $recSort, expert: $expert)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Author &&
      o.id == id &&
      o.icon == icon &&
      o.name == name &&
      o.description == description &&
      o.link == link &&
      o.latestReleaseTime == latestReleaseTime &&
      o.videoNum == videoNum &&
      o.adTrack == adTrack &&
      o.follow == follow &&
      o.shield == shield &&
      o.approvedNotReadyVideoCount == approvedNotReadyVideoCount &&
      o.ifPgc == ifPgc &&
      o.recSort == recSort &&
      o.expert == expert;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      icon.hashCode ^
      name.hashCode ^
      description.hashCode ^
      link.hashCode ^
      latestReleaseTime.hashCode ^
      videoNum.hashCode ^
      adTrack.hashCode ^
      follow.hashCode ^
      shield.hashCode ^
      approvedNotReadyVideoCount.hashCode ^
      ifPgc.hashCode ^
      recSort.hashCode ^
      expert.hashCode;
  }
}

class Follow {
  final String itemType;
  final int itemId;
  final bool followed;
  Follow({
    this.itemType,
    this.itemId,
    this.followed,
  });

  Follow copyWith({
    String itemType,
    int itemId,
    bool followed,
  }) {
    return Follow(
      itemType: itemType ?? this.itemType,
      itemId: itemId ?? this.itemId,
      followed: followed ?? this.followed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemType': itemType,
      'itemId': itemId,
      'followed': followed,
    };
  }

  static Follow fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Follow(
      itemType: map['itemType'],
      itemId: map['itemId']?.toInt(),
      followed: map['followed'],
    );
  }

  String toJson() => json.encode(toMap());

  static Follow fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Follow(itemType: $itemType, itemId: $itemId, followed: $followed)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Follow &&
      o.itemType == itemType &&
      o.itemId == itemId &&
      o.followed == followed;
  }

  @override
  int get hashCode => itemType.hashCode ^ itemId.hashCode ^ followed.hashCode;
}

class Shield {
  final String itemType;
  final int itemId;
  final bool shielded;
  Shield({
    this.itemType,
    this.itemId,
    this.shielded,
  });

  Shield copyWith({
    String itemType,
    int itemId,
    bool shielded,
  }) {
    return Shield(
      itemType: itemType ?? this.itemType,
      itemId: itemId ?? this.itemId,
      shielded: shielded ?? this.shielded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemType': itemType,
      'itemId': itemId,
      'shielded': shielded,
    };
  }

  static Shield fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Shield(
      itemType: map['itemType'],
      itemId: map['itemId']?.toInt(),
      shielded: map['shielded'],
    );
  }

  String toJson() => json.encode(toMap());

  static Shield fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Shield(itemType: $itemType, itemId: $itemId, shielded: $shielded)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Shield &&
      o.itemType == itemType &&
      o.itemId == itemId &&
      o.shielded == shielded;
  }

  @override
  int get hashCode => itemType.hashCode ^ itemId.hashCode ^ shielded.hashCode;
}

class Cover {
  final String feed;
  final String detail;
  final String blurred;
  final String sharing;
  final String homepage;
  Cover({
    this.feed,
    this.detail,
    this.blurred,
    this.sharing,
    this.homepage,
  });

  Cover copyWith({
    String feed,
    String detail,
    String blurred,
    String sharing,
    String homepage,
  }) {
    return Cover(
      feed: feed ?? this.feed,
      detail: detail ?? this.detail,
      blurred: blurred ?? this.blurred,
      sharing: sharing ?? this.sharing,
      homepage: homepage ?? this.homepage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'feed': feed,
      'detail': detail,
      'blurred': blurred,
      'sharing': sharing,
      'homepage': homepage,
    };
  }

  static Cover fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Cover(
      feed: map['feed'],
      detail: map['detail'],
      blurred: map['blurred'],
      sharing: map['sharing'],
      homepage: map['homepage'],
    );
  }

  String toJson() => json.encode(toMap());

  static Cover fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cover(feed: $feed, detail: $detail, blurred: $blurred, sharing: $sharing, homepage: $homepage)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Cover &&
      o.feed == feed &&
      o.detail == detail &&
      o.blurred == blurred &&
      o.sharing == sharing &&
      o.homepage == homepage;
  }

  @override
  int get hashCode {
    return feed.hashCode ^
      detail.hashCode ^
      blurred.hashCode ^
      sharing.hashCode ^
      homepage.hashCode;
  }
}

class WebUrl {
  final String raw;
  final String forWeibo;
  WebUrl({
    this.raw,
    this.forWeibo,
  });

  WebUrl copyWith({
    String raw,
    String forWeibo,
  }) {
    return WebUrl(
      raw: raw ?? this.raw,
      forWeibo: forWeibo ?? this.forWeibo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'raw': raw,
      'forWeibo': forWeibo,
    };
  }

  static WebUrl fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return WebUrl(
      raw: map['raw'],
      forWeibo: map['forWeibo'],
    );
  }

  String toJson() => json.encode(toMap());

  static WebUrl fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'WebUrl(raw: $raw, forWeibo: $forWeibo)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is WebUrl &&
      o.raw == raw &&
      o.forWeibo == forWeibo;
  }

  @override
  int get hashCode => raw.hashCode ^ forWeibo.hashCode;
}