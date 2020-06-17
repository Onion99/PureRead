import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/page/aggregationnews/model/zhihuday.dart';
import 'package:pure_read/page/aggregationnews/model/zhihuday_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ModelZhihu extends StatelessWidget {
  AnimationController animationController;
  Animation<dynamic> animation;
  final ZhihuDay day;
  ModelZhihu({this.day, this.animationController, this.animation});

  ZhihuDayDetail newDetail;

  Future<bool> setNewsDetail() async {
    if (newDetail != null) {
      return true;
    } else {
      newDetail = await HttpDao.getZhihuNewsDetailDao(day.id.toString());
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 50 * (1.0 - animation.value), 0.0),
              child: Card(
                margin: EdgeInsets.all(19),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 6.0,
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  splashColor: Colors.transparent,
                  onTap: () {
                    NavigatorUtil.pushWeb(context,
                        title: day.title, url: day.url, isHome: false);
                  },
                  child: Container(
                    height: 293,
                    child: FutureBuilder(

                      future: setNewsDetail(),
                      builder: (_, snapShot) {
                        if ( newDetail == null) {
                          return Center(
                              child: SpinKitWave(color: Colors.lightBlueAccent));
                        } else {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),

                            /// 层叠布局
                            child: Column(
                              children: <Widget>[
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: CachedNetworkImage(
                                    //预览图
                                    fit: BoxFit.fitWidth,
                                    imageUrl: day == null
                                        ? HttpDao.loadingImage
                                        : newDetail.image,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(
                                      backgroundColor: Colors.pink,
                                    ),
                                    // width: 140.0,
                                    // height: 88.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                Text(
                                  day == null ? '' : day.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3),
                                ),
                                Text(
                                  day == null ? '' : day.hint,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black54),
                                )
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
