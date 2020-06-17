import 'package:pure_read/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BingPhoto/cards_section_alignment.dart';
import 'hitokoto_page.dart';

class OnetimePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppTheme.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Padding(
                  padding: EdgeInsets.only(left: 50),
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
                          text: "必应美图",
                        ),
                        Tab(
                          text: "一言",
                        ),
                      ]),
                ),              ),
            ),
            body: TabBarView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                CardsSectionAlignment(context),
                HitokotoPage(),
              ],
            )));
  }

}