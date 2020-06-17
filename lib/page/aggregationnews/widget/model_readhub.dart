import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/page/aggregationnews/model/ReadHub/ReadhubDay.dart';
import 'package:flutter/material.dart';

class ModelReadhub extends StatelessWidget {
  AnimationController animationController;
  Animation<dynamic> animation;
  ReadhubDay day;
  ModelReadhub({this.day, this.animationController, this.animation});

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
              child: Card(
                margin: EdgeInsets.fromLTRB(13, 6, 13, 19),
                elevation: 8.0,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    splashColor: Colors.transparent,
                    onTap: () {
                      NavigatorUtil.pushWeb(context,
                          title: day.title, url: day.newsArray[0].url, isHome: false);
                    },
                    child: Container(
                      height: 190,
                      margin: EdgeInsets.fromLTRB(14, 16, 14, 10),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start
                          ,
                          children: <Widget>[
                            Text(
                              day == null ? '' : day.title,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 18)),
                            Text(
                              day == null ? '' : day.summary,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 15)),
                            Text(
                              day == null ? '' : "${day.newsArray[0].siteName} 等${day.newsArray.length}家媒体报道",
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black45
                              ),
                            ),
                          ],
                        ))
                    )),
              /*child: Container(
                  child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {},

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.white38,
                              offset: const Offset(1, 1),
                              blurRadius: 0)
                        ]),
                    child: FutureBuilder(
                      future: setNewsDetail(),
                      builder: (_, snapShot) {
                        if (!snapShot.hasData) {
                          return Center(
                            child: Text('加载中'),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6.0)),
                            /// 层叠布局
                            child: Column(
                              children: <Widget>[
                                Text(
                                  day == null ? '' : day.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    ),
                                ),
                                Padding(padding: EdgeInsets.only(top:10)),
                                Text(
                                  day == null ? '' : day.summary,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 14
                                  ),
                                  )
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                  ),*/
            ),
          );
        });
  }
}
