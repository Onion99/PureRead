
import 'package:pure_read/page/home/news_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'object_util.dart';
class NavigatorUtil {

  static void pushWeb(BuildContext context,
      {String title, String titleId, String url, bool isHome: false}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;
    if (url.endsWith(".apk")) {
      launchInBrowser(url, title: title ?? titleId);
    } else {
      Navigator.push(
          context,
          new CupertinoPageRoute<void>(
              builder: (ctx) => new NewWeb(
                title: title,
                id: titleId,
                url: url,
              )));
    }
  }



  static Future<Null> launchInBrowser(String url, {String title}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
