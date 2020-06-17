import 'package:pure_read/common/dao/note.dart';
import 'package:pure_read/page/read_note/reader_notes_write.dart';
import 'package:flutter/material.dart';

class ModelNotes extends StatelessWidget {
  AnimationController animationController;
  Animation<dynamic> animation;
  Note note;
  VoidCallback onPressedDelete;
  VoidCallback onPressedOpen;
  ModelNotes({this.note, this.animationController, this.animation,this.onPressedDelete,this.onPressedOpen});

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
                  margin: EdgeInsets.all(8),
                  elevation: 3.6,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13.0))),
                  child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      splashColor: Colors.transparent,
                      onTap: () {
                        onPressedOpen();
                      },
                      child: Container(
                          height: 130,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    note.time.substring(0, 10),
                                    style: TextStyle(
                                        fontFamily: "Lobster",
                                        fontSize: 18.0),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width),
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.only(bottom:3),
                                    icon: Icon(Icons.close),
                                    tooltip: '删除笔记',
                                    onPressed: () {
                                      onPressedDelete();
                                    },
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              Text(
                                note == null ? '' : note.title,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(

                                  fontFamily: "LanTing",
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          )))),
            ),
          );
        });
  }
}
