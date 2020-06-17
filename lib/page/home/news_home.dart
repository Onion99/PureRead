import 'package:pure_read/page/custom_drawer/drawer_user_controller.dart';
import 'package:pure_read/page/custom_drawer/home_drawer.dart';
import 'package:pure_read/page/eyepetizer/eyepetizer_home.dart';
import 'package:pure_read/page/my_collect/reader_page.dart';
import 'package:pure_read/page/read_note/reader_notes.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'news_hotsite.dart';

class NewsHome extends StatefulWidget {
  @override
  NewsHomeState createState() {
    return NewsHomeState();
  }
}


class NewsHomeState extends State<NewsHome> {
  NewsHotsite hotsite = NewsHotsite();
  DrawerIndex drawerIndex;
  /// 抽屉弹出动画控制器
  AnimationController sliderAnimationController;
  Widget screenView;

  @override
  void initState() {
    screenView = hotsite;
  }

  @override
  Widget build(BuildContext context) {
    /// Container是一个组合类容器
    /// 是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器
    return Container(
      color: AppTheme.nearlyWhite,
      /// 异形屏适配
      child: SafeArea(
        /// 包含导航栏、抽屉菜单(Drawer)以及底部Tab导航菜单的路由页
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            /// 抽屉选项
            screenIndex: drawerIndex,
            /// 抽屉宽度
            drawerWidth: MediaQuery.of(context).size.width * 0.7,
            /// 弹出动画控制
            animationController: (AnimationController controller){
//              sliderAnimationController = controller;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            /// 当前路由
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch(drawerIndex){
        case DrawerIndex.HOME:
          screenView = hotsite;
          break;
        case DrawerIndex.NOTE:
          screenView = ReaderNotes();
          break;
        case DrawerIndex.COLLECTION:
          screenView = ReaderPages();
          break;
        case DrawerIndex.VEDIO:
          screenView = EyepetizerHome();
          break;
        case DrawerIndex.About:
          // TODO: Handle this case.
          break;
      }
      setState(() {

      });
    }
    }

    
}
