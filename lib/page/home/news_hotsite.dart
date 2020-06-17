
import 'package:pure_read/page/aggregationnews/aggregationnews_page.dart';
import 'package:pure_read/page/one_time/onetime_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'news_hotsite_listnew.dart';


class NewsHotsite extends StatefulWidget {
  @override
  NewsHotsiteState createState() {
    return NewsHotsiteState();
   
  }
  
}

class NewsHotsiteState extends State<NewsHotsite>{

    int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    NewsHotsiteListnews(),
    AggregationNews(),
    OnetimePage(),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                color: Colors.grey[800],
                activeColor: Colors.blue,
                iconSize: 24,
                // backgroundColor: Colors.black,
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabs: [
                  GButton(
                    icon: LineIcons.newspaper_o,
                    text: '要闻',
                  ),
                  GButton(
                    icon: LineIcons.stack_overflow,
                    text: '聚合',
                  ),
                  GButton(
                    icon: LineIcons.hacker_news,
                    text: '一刻',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
  
}