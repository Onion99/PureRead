import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/page/aggregationnews/model/zhihuday.dart';
import 'package:pure_read/page/aggregationnews/widget/model_zhihu.dart';
import 'package:pure_read/provider/provider_widget.dart';
import 'package:pure_read/provider/view_state_busy_widget.dart';
import 'package:pure_read/view_model/zhihunews_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ZhihuPage extends StatefulWidget {
  @override
  ZhihuPageState createState() {
    // TODO: implement createState
    return ZhihuPageState();
  }
}

class ZhihuPageState extends State<ZhihuPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  List<ZhihuDay> dayNews;

  Future<bool> setDayNews() async {
    dayNews = await HttpDao.getZhihuNewsDao();
    return true;
  }

  AnimationController animationController;
  DateTime dateTime;

  EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _easyRefreshController = EasyRefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ProviderWidget<ZhihuNewsModel>(
        model: ZhihuNewsModel(),
        onModelReady: (model) {
          model.initData();
        },
        builder: (context, model, child) {
          if (model.isBusy) {
            return SpinKitFoldingCube(color: Colors.blue);
          }
          else if (model.isError) {
            return ViewStateErrorWidget(
                error: model.viewStateError, onPressed: model.initData);
          } else if (model.isEmpty) {
            return ViewStateEmptyWidget(onPressed: model.initData);
          }
          dayNews = model.list;
          return EasyRefresh(
            header: BezierCircleHeader(),
            enableControlFinishLoad: true,
            // ignore: missing_return
            onRefresh: () {
              model.refresh();
            },
            controller: _easyRefreshController,
            child: ListView.builder(
              itemCount: dayNews.length,
              itemBuilder: (BuildContext context, int index) {
                final int count = dayNews.length > 10 ? 10 : dayNews.length;
                final Animation<double> animatio =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();
                return ModelZhihu(
                  day: dayNews[index],
                  animation: animatio,
                  animationController: animationController,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 16.0,
          child: Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime newDateTime = await showRoundedDatePicker(
              context: context,
              locale: Locale("zh", "CN"),
              theme: ThemeData.light(),
              initialDate: ZhihuNewsModel.dateTimeSelect,
              firstDate: DateTime(DateTime.now().year - 2),
              lastDate: DateTime(DateTime.now().year + 0, DateTime.now().month,
                  DateTime.now().day + 1),
              borderRadius: 12,
            );
            if (newDateTime != null) {
              changeDate(newDateTime);
            }
          }),
    );
  }

  void changeDate(DateTime selectDate) {
    dateTime = selectDate;
    ZhihuNewsModel.dateTimeSelect = dateTime;
    setState(() {
      _easyRefreshController.callRefresh();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
