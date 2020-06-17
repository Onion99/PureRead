
import 'package:pure_read/common/net/address.dart';
import 'package:pure_read/page/eyepetizer/eyepetizer_hot_view.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EyepetizerHot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppTheme.nearlyWhite,
              title: Center(
                child:Text(
                  "热门排行",
                  style: TextStyle(
                    fontFamily: "LanTing-Bold",
                    color: AppTheme.darkText,
                  ),
                )
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(46),
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: TabBar(
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent,
                              width: 3.0,
                              style: BorderStyle.solid
                          ),
                          insets: EdgeInsets.fromLTRB(
                              40.0,0, 40.0, 0)),
                      /// 控制 标签与指示线得距离
                      indicatorWeight: 3,
                      isScrollable: false,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Color(0xff2d386b),
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w500),
                      unselectedLabelColor: Colors.black26,
                      tabs: [
                        Tab(
                          text: "周排行",
                        ),
                        Tab(
                          text: "月排行",
                        ),
                        Tab(
                          text: "总排行",
                        ),
                      ]),
                ),              ),
            ),
            body: TabBarView(
              physics: new NeverScrollableScrollPhysics(),
              children: <Widget>[
                EyepetizerHotView(Address.WEEKLY_RANKING),
                EyepetizerHotView(Address.MONTHLY_RANKING),
                EyepetizerHotView(Address.TOTALLY_RANKING),
              ],
            )));
  }

}
