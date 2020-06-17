import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/page/eyepetizer/widget/jump_show.dart';
import 'package:pure_read/provider/provider_widget.dart';
import 'package:pure_read/provider/view_state_busy_widget.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:pure_read/view_model/eyepetizerbanner_model.dart';
import 'package:pure_read/view_model/eyepetizerhome_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'model/Issue_entity.dart';

class EyepetizerDaily extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EyepetizerDailyState();
  }
}

class EyepetizerDailyState extends State<EyepetizerDaily>
    with TickerProviderStateMixin {
  AnimationController animationScrollController;
  AnimationController animationScaleController;
  AnimationController animationRotationController;
  List<ItemList> itemList = <ItemList>[];
  List<ItemList> bannerList = <ItemList>[];

  @override
  void initState() {
    final double pullDistance = 150.0;
    animationScrollController = new AnimationController(
      duration: Duration(milliseconds: 100),
      upperBound: pullDistance,
      lowerBound: 0.0,
      vsync: this,
    );
    animationScrollController.addListener(() {
      setState(() {});
    });

    animationScaleController = new AnimationController(
      duration: Duration(milliseconds: 100),
      upperBound: 1.0,
      lowerBound: 0.0,
      vsync: this,
    );
    animationScaleController.addListener(() {
      setState(() {});
    });
    animationScaleController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        print("动画销毁");
      }
    });
    animationRotationController = new AnimationController(
      duration: Duration(milliseconds: 500),
      upperBound: 1.0,
      lowerBound: 0.0,
      vsync: this,
    );
    animationRotationController.addListener(() {
      setState(() {});
    });
  }

  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.nearlyWhite,
        title: Center(
            child: Text("开眼日报",
                style: TextStyle(
                  fontFamily: "LanTing-Bold",
                  color: AppTheme.darkText,
                ))),
      ),
      body: ProviderWidget<EyepetizerBannerModel>(
        model: EyepetizerBannerModel(),
        onModelReady: (model) {
          model.initData();
        },
        builder: (context, model, child) {
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
          bannerList = model.list;
          return ProviderWidget<EyepetizerHomeModel>(
            model: EyepetizerHomeModel(),
            onModelReady: (model) {
              model.initData();
            },
            builder: (context, model, child) {
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
              itemList = model.list;
              return EasyRefresh(
                footer: BezierBounceFooter(),
                onLoad: () {
                  model.loadMore();
                },
                controller: model.refreshController,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: itemList.length+1,
                  itemBuilder: (BuildContext context, int position) {
                    if (position == 0) {
                      return getBanner();
                    }
                    position--;
                    if (itemList[position].type == "textHeader") {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
                          child: new Text(
                            itemList[position].data.text,
                            style: new TextStyle(
                                fontFamily: "Lobster",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: AppTheme.nearlyWhite,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.0,
                                spreadRadius: 1.0)
                          ]),
                      child: GestureDetector(
                        onTap: () {
                          NavigatorUtil.pushWeb(context,
                              title: itemList[position].data?.title,
                              url: itemList[position]
                                  .data
                                  .webUrl
                                  .raw
                                  .replaceAll("http", "https"));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              children: <Widget>[
                                CachedNetworkImage(
                                    imageUrl: itemList[position].data.cover.feed,
                                    fit: BoxFit.fitWidth),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Text(itemList[position].data.title,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "LanTing",
                                                color: AppTheme.darkText)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget getBanner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 3.6 / 10 * MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
              spreadRadius: 1.0)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Swiper(
          itemCount: bannerList.length,
          autoplayDelay: 3000,
          autoplay: true,
          pagination: new SwiperPagination(
            builder: new DotSwiperPaginationBuilder(
              size: 8.0,
              color: Colors.grey,
              activeColor: Colors.white,
              activeSize: 8.0,
            ),
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                NavigatorUtil.pushWeb(context,
                    title: bannerList[index].data?.title,
                    url: bannerList[index]
                        .data
                        .webUrl
                        .raw
                        .replaceAll("http", "https"));
              },
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: bannerList[index].data.cover.feed,
                      fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Image.asset(
                        "assets/images/home_page_header_icon.png",
                        height: 35.0,
                      ),
                      padding: EdgeInsets.only(top: 10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: JumpShowTextView(
                        milliseconds: 800,
                        text: bannerList[index].data.title,
                        style: new TextStyle(
                            color: Colors.white, fontFamily: 'LanTing-Bold'),
                      ),
                      padding: EdgeInsets.fromLTRB(16, 80, 16, 0),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
