import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/page/aggregationnews/model/ReadHub/ReadhubDay.dart';
import 'package:pure_read/page/aggregationnews/widget/model_readhub.dart';
import 'package:pure_read/provider/provider_widget.dart';
import 'package:pure_read/provider/view_state_busy_widget.dart';
import 'package:pure_read/view_model/readhubnews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class ReadhubPage extends StatefulWidget {
  @override
  ReadhubPageState createState() {
    // TODO: implement createState
    return ReadhubPageState();
  }
}

class ReadhubPageState extends State<ReadhubPage>
    with TickerProviderStateMixin,SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin  {
  List<ReadhubDay> dayNews;

  Future<bool> setDayNews() async {
//    dayNews = await HttpDao.getReadNews();
    return true;
  }

  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ReadhubNewsModel>(
        model: ReadhubNewsModel(),
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
          } else if (model.isEmpty) {
            return ViewStateEmptyWidget(onPressed: model.initData);
          }
          dayNews = model.list;
          return EasyRefresh(
              header: BezierCircleHeader(),
              footer: BezierBounceFooter(),
              onRefresh: () {
                model.refresh();
              },
              onLoad: () {
                model.loadMore();
              },
              controller: model.refreshController,
              child: ListView.builder(
                itemCount: dayNews.length,
                itemBuilder: (BuildContext context, int index) {
                  final int count = dayNews.length > 10 ? 10 : dayNews.length;
                  final Animation<double> animatio =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();
                  if(index == dayNews.length-1){
                    ReadhubNewsModel.cursor =dayNews[index].order;
                  }
                  return ModelReadhub(
                    day: dayNews[index],
                    animation: animatio,
                    animationController: animationController,
                  );
                },
              ));
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
