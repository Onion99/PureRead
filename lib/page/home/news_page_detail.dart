import 'dart:async';
import 'dart:convert';

import 'package:pure_read/page/aggregationnews/model/zhihuday_detail.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPageDetail extends StatefulWidget {
  ZhihuDayDetail news;
  NewsPageDetail(this.news);
  @override
  NewDetailState createState() {
    return NewDetailState(news.body);
  }
}

class NewDetailState extends State<NewsPageDetail> {
  final Completer<WebViewController> _webController =
      Completer<WebViewController>();
  String newsUrl;
  NewDetailState(this.newsUrl);
  WebViewController _controller;

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    controller.loadUrl(Uri.dataFromString(filename,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('News detail'),
      //   actions: <Widget>[],
      // ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: newsUrl,

          /// 是否支持JS
          javascriptMode: JavascriptMode.unrestricted,

          /// 控制器
          onWebViewCreated: (WebViewController controller) {
            _webController.complete(controller);
          },

          /// 用于处理 S代码
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),

          /// 前进后退手势操作，只在IOS有效
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
