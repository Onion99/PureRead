import 'dart:async';
import 'dart:convert';
import 'package:pure_read/common/dao/note.dart';
import 'package:pure_read/theme/app_theme.dart';
import 'package:oktoast/oktoast.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

import 'images.dart';

class ReaderNotesWrtite extends StatefulWidget {
  final bool editing;
  final Note note;
  bool hasNote = false;

  ReaderNotesWrtite(
      {Key key, @required this.editing, @required this.note, this.hasNote});

  @override
  ReaderNotesWriteState createState() {
    return ReaderNotesWriteState(editing, note, hasNote);
  }
}

class ReaderNotesWriteState extends State<ReaderNotesWrtite> {
  ZefyrController _zefyrController;

  final FocusNode _focusNode = FocusNode();

  Note note;
  bool _editing;
  bool hasNote = false;

  ReaderNotesWriteState(this._editing, this.note, this.hasNote);

  @override
  void initState() {
    if (_editing) {
      _zefyrController =
          ZefyrController(NotusDocument.fromDelta(Delta()..insert("  \n")));
    } else {
      print(note.toString());
      if (note.content == null) {
        _zefyrController =
            ZefyrController(NotusDocument.fromDelta(Delta()..insert("  \n")));
      } else {
        _zefyrController =
            ZefyrController(NotusDocument.fromJson(json.decode(note.content)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final done = _editing
        ? IconButton(
            onPressed: _stopEditing,
            icon: Icon(
              Icons.save,
              color: AppTheme.darkText,
            ))
        : IconButton(
            onPressed: _startEditing,
            icon: Icon(
              Icons.edit,
              color: AppTheme.darkText,
            ));
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppTheme.nearlyWhite,
        brightness: Brightness.light,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Center(
          child: Text(
            "笔记编辑",
            style: TextStyle(
              color: AppTheme.darkText,
              fontFamily: "LanTing",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          done,
        ],
      ),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          controller: _zefyrController,
          focusNode: _focusNode,
          mode: _editing ? ZefyrMode.edit : ZefyrMode.select,
          imageDelegate: CustomImageDelegate(),
          keyboardAppearance: Brightness.light,
        ),
      ),
    );
  }

  void _startEditing() {
    setState(() {
      _editing = true;
    });
  }

  void _stopEditing() {
    setState(() {
      _editing = false;
      updateNoteDB();
    });
  }

  void updateNoteDB() {
    final notes = json.encode(_zefyrController.document);
    if (notes.length <= 20) {
      showToast("笔记为空");
      return null;
    }
    final titleFake = notes.replaceFirst('''[{"insert":"'''," ");
    debugPrint(notes);
    debugPrint(titleFake);
    final title = titleFake.substring(0,titleFake.indexOf("\""));
    if (hasNote) {
      NoteProvider.update(Note(
          id: note.id,
          time: DateTime.now().toIso8601String(),
          title: title,
          content: notes));
    } else {
      var time = DateTime.now().toIso8601String();
      NoteProvider.insert(Note(time: time, title: title, content: notes));
      getNowNote(time);
    }
  }

  Future<void> getNowNote(String time) async {
    note = await NoteProvider.getNoteByTime(time);
    hasNote = true;
  }
}
