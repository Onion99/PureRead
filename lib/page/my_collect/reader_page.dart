

import 'package:pure_read/common/dao/note.dart';
import 'package:pure_read/common/util/navigator_util.dart';
import 'package:pure_read/page/read_note/reader_notes_item.dart';
import 'package:pure_read/page/read_note/reader_notes_write.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReaderPages extends StatefulWidget {
  @override
  ReaderPagesState createState() {
    // TODO: implement createState
    return ReaderPagesState();
  }
}

class ReaderPagesState extends State<ReaderPages> with TickerProviderStateMixin {
  List<Note> noteList;
  AnimationController animationController;

  Future<List<Note>> getNoteList() async {
    noteList = await NoteProvider.getWebPageAll();
    print(noteList.toString());
    return noteList;
  }


  @override
  void initState() {
    super.initState();
    NoteProvider.open();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment(0.0, 0.0),
                child: Text(
                  '我的收藏',
                  style: TextStyle(
                    fontFamily: "LanTing-Bold",
                    color: Colors.black,
                  ),
                )),
          ],
        ),
        backgroundColor: AppTheme.nearlyWhite,
      ),
      body: FutureBuilder(
        future: getNoteList(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if(noteList == null){
            return Container(
              color: Colors.white,
            );
          }
          else{
            return ListView.builder(
                itemCount: noteList.length,
                itemBuilder: (BuildContext context, int index) {
                  final int count = noteList.length > 10 ? 10 : noteList.length;
                  final Animation<double> animatio =
                  Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn)));
                  animationController.forward();
                  return ModelNotes(
                    note: noteList[index],
                    animation: animatio,
                    animationController: animationController,
                    onPressedDelete: (){
                      NoteProvider.delete(noteList[index].id);
                      setState(() {});
                    },
                    onPressedOpen: (){
                      NavigatorUtil.pushWeb(context,
                          title: noteList[index].title, url: noteList[index].content, isHome: false);
                    },
                  );
                }
            );
          }
        },
      )
    );
  }
}
