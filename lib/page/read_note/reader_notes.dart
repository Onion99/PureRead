
import 'package:pure_read/common/dao/note.dart';
import 'package:pure_read/page/read_note/reader_notes_item.dart';
import 'package:pure_read/page/read_note/reader_notes_write.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReaderNotes extends StatefulWidget {
  @override
  ReaderNotesState createState() {
    // TODO: implement createState
    return ReaderNotesState();
  }
}

class ReaderNotesState extends State<ReaderNotes> with TickerProviderStateMixin {
  List<Note> noteList;
  AnimationController animationController;

  Future<List<Note>> getNoteList() async {
    noteList = await NoteProvider.getNoteAll();
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
                  '阅览笔记',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ReaderNotesWrtite(
                        editing: false,
                        note: noteList[index],
                        hasNote: true,
                      );
                    }));
                  },
                );
              }
            );
          }
        },
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ReaderNotesWrtite(
              editing: true,
              note: null,
              hasNote: false,
            );
          }));
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: const BoxDecoration(
            gradient: AppGradients.blueAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(28.0),
            ),
          ),
          child: Icon(Icons.add),
        ),
        tooltip: 'Add Note',
      ),
    );
  }
}
