
import 'package:pure_read/page/home/widgets/news_item.dart';
import 'package:pure_read/provider/provider_widget.dart';
import 'package:pure_read/provider/view_state_busy_widget.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/model/news.dart';
import 'package:pure_read/view_model/hotnews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsHotsiteListnews extends StatefulWidget {
  NewsHotsiteListnews({Key key}) : super(key: key);

  @override
  NewsHotsiteListnewsState createState() {
    return NewsHotsiteListnewsState();
  }
}

class NewsHotsiteListnewsState extends State<NewsHotsiteListnews>
    with AutomaticKeepAliveClientMixin {

  // 新闻集合
  List<News> listNews = List();
  bool loading;
  final String weChatNewsUrl = "https://c.m.163.com/news/a/";
  /// item绘制
  _renderItem(News news) {
    // print(news.toString());
    NewsViewModel reposViewModel = NewsViewModel.fromMap(news);
    return new NewsItem(reposViewModel, onPressed: () {
      NavigatorUtil.pushWeb(context,
          title: news.title, url: weChatNewsUrl+(news.path.substring(32,news.path.length)), isHome: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Text(
                    '今日要闻',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          backgroundColor: AppTheme.nearlyWhite,
        ),
        body: ProviderWidget<HotNewsModel>(
            model: HotNewsModel(),
            onModelReady: (model) {
              model.initData();
            },
            builder: (context, model, child) {
              // Model数据缓冲
              if (model.isBusy) {
                return SpinKitFoldingCube(color: Colors.blue);
              }
              // Model数据错误
              else if (model.isError) {
                return ViewStateErrorWidget(
                    error: model.viewStateError, onPressed: model.initData);
              }
              else if(model.isEmpty){
                return ViewStateEmptyWidget(onPressed: model.initData);
              }
              listNews = model.list;
              return EasyRefresh(
                header: BezierCircleHeader(),
                footer: BezierBounceFooter(),
                controller: model.refreshController,
                onRefresh: (){
                  model.refresh();
                },
                onLoad: (){
                  model.loadMore();
                },
                child: ListView.builder(
                  itemCount: listNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _renderItem(listNews[index]);
                  },
                ),
              );
            }));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
