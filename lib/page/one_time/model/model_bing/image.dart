import 'dart:convert';

import 'package:flutter/foundation.dart';

class Image {
  final String startdate;
  final String fullstartdate;
  final String enddate;
  final String url;
  final String urlbase;
  final String copyright;
  final String copyrightlink;
  final String title;
  final String quiz;
  final bool wp;
  final String hsh;
  final int drk;
  final int top;
  final int bot;
  final List<dynamic> hs;
  Image({
    this.startdate,
    this.fullstartdate,
    this.enddate,
    this.url,
    this.urlbase,
    this.copyright,
    this.copyrightlink,
    this.title,
    this.quiz,
    this.wp,
    this.hsh,
    this.drk,
    this.top,
    this.bot,
    this.hs,
  });

  Image copyWith({
    String startdate,
    String fullstartdate,
    String enddate,
    String url,
    String urlbase,
    String copyright,
    String copyrightlink,
    String title,
    String quiz,
    bool wp,
    String hsh,
    int drk,
    int top,
    int bot,
    List<dynamic> hs,
  }) {
    return Image(
      startdate: startdate ?? this.startdate,
      fullstartdate: fullstartdate ?? this.fullstartdate,
      enddate: enddate ?? this.enddate,
      url: url ?? this.url,
      urlbase: urlbase ?? this.urlbase,
      copyright: copyright ?? this.copyright,
      copyrightlink: copyrightlink ?? this.copyrightlink,
      title: title ?? this.title,
      quiz: quiz ?? this.quiz,
      wp: wp ?? this.wp,
      hsh: hsh ?? this.hsh,
      drk: drk ?? this.drk,
      top: top ?? this.top,
      bot: bot ?? this.bot,
      hs: hs ?? this.hs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startdate': startdate,
      'fullstartdate': fullstartdate,
      'enddate': enddate,
      'url': url,
      'urlbase': urlbase,
      'copyright': copyright,
      'copyrightlink': copyrightlink,
      'title': title,
      'quiz': quiz,
      'wp': wp,
      'hsh': hsh,
      'drk': drk,
      'top': top,
      'bot': bot,
      'hs': List<dynamic>.from(hs.map((x) => x)),
    };
  }

  static Image fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Image(
      startdate: map['startdate'],
      fullstartdate: map['fullstartdate'],
      enddate: map['enddate'],
      url: map['url'],
      urlbase: map['urlbase'],
      copyright: map['copyright'],
      copyrightlink: map['copyrightlink'],
      title: map['title'],
      quiz: map['quiz'],
      wp: map['wp'],
      hsh: map['hsh'],
      drk: map['drk']?.toInt(),
      top: map['top']?.toInt(),
      bot: map['bot']?.toInt(),
      hs: List<dynamic>.from(map['hs']),
    );
  }

  String toJson() => json.encode(toMap());

  static Image fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Image(startdate: $startdate, fullstartdate: $fullstartdate, enddate: $enddate, url: $url, urlbase: $urlbase, copyright: $copyright, copyrightlink: $copyrightlink, title: $title, quiz: $quiz, wp: $wp, hsh: $hsh, drk: $drk, top: $top, bot: $bot, hs: $hs)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Image &&
      o.startdate == startdate &&
      o.fullstartdate == fullstartdate &&
      o.enddate == enddate &&
      o.url == url &&
      o.urlbase == urlbase &&
      o.copyright == copyright &&
      o.copyrightlink == copyrightlink &&
      o.title == title &&
      o.quiz == quiz &&
      o.wp == wp &&
      o.hsh == hsh &&
      o.drk == drk &&
      o.top == top &&
      o.bot == bot &&
      listEquals(o.hs, hs);
  }

  @override
  int get hashCode {
    return startdate.hashCode ^
      fullstartdate.hashCode ^
      enddate.hashCode ^
      url.hashCode ^
      urlbase.hashCode ^
      copyright.hashCode ^
      copyrightlink.hashCode ^
      title.hashCode ^
      quiz.hashCode ^
      wp.hashCode ^
      hsh.hashCode ^
      drk.hashCode ^
      top.hashCode ^
      bot.hashCode ^
      hs.hashCode;
  }
}