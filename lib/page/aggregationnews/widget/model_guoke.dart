import 'package:pure_read/common/util/navigator_util.dart';

import 'package:pure_read/common/dao/httpdao.dart';
import 'package:pure_read/page/aggregationnews/model/Guoke/GuokeDay.dart';
import 'package:pure_read/page/home/guokenews_web.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelGuoke extends StatelessWidget {
  AnimationController animationController;
  Animation<dynamic> animation;
  GuokeDay day;
  ModelGuoke({this.day, this.animationController, this.animation});

  Future<bool> setNewsDetail() async {
    return true;
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
              child: Container(
                margin: EdgeInsets.fromLTRB(12, 8, 12, 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(

                          /// 颜色透明度
                          ///color: Colors.black12.withOpacity(0.6),
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(1, 1),
                          blurRadius: 8)
                    ]),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: Colors.transparent,
                  onTap: () {
                    print(day.toString());

/*                    Navigator.push(
                        context,
                        new CupertinoPageRoute<void>(
                            builder: (ctx) => GuokeNewsWeb(
                                  title: day.title,
                                  url: day.url,
                                )));*/
/*                     NavigatorUtil.pushWeb(context,
                         title: day.title, url: day.url.replaceAll(RegExp('http://www'),'https:www'), isHome: false);*/
                     NavigatorUtil.pushWeb(context,
                         title: day.title, url: day.url.replaceAll(RegExp('http://www'),'https:m'), isHome: false);
                  },
                  child: FutureBuilder(
                    future: setNewsDetail(),
                    builder: (_, snapShot) {
                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),

                        /// 层叠布局
                        child: Column(
                          /// 水平对齐
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedNetworkImage(
                                //预览图
                                fit: BoxFit.cover,
                                imageUrl: day == null
                                    ? HttpDao.loadingImage
                                    : day.small_image,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(
                                  backgroundColor: Colors.pink,
                                ),
                                // width: 140.0,
                                // height: 88.0,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 7)),
                            Text(
                              day == null ? '' : day.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              day == null ? '' : day.summary,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 13),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
