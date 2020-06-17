
import 'package:pure_read/page/eyepetizer/eyepetizer_daily.dart';
import 'package:pure_read/page/eyepetizer/eyepetizer_hot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class EyepetizerHome extends StatefulWidget{
  @override
  EyepetizerHomeState createState() {
    // TODO: implement createState
    return EyepetizerHomeState();
  }

}
class EyepetizerHomeState extends State<EyepetizerHome>{
  @override
  Widget build(BuildContext context) {
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
                    icon: LineIcons.calendar,
                    text: '日报',
                  ),
                  GButton(
                    icon: LineIcons.heart_o,
                    text: '热门',
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    EyepetizerDaily(),
    EyepetizerHot()
  ];


}