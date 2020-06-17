import 'dart:async';

import 'package:sqflite/sqflite.dart';

// 表命
final String tableNote = 'note';
final String tableCollect = 'collect';
// 列名
final String columnId = '_id';
// 内容
final String columnContent = 'content';
// 标题
final String columnTitle = 'title';
// 时间
final String columnTime = 'time';

// notes model

class Note {
  Note({this.content, this.title, this.time, this.id});

  // 从日志读取
  Note.fromMap(Map map) {
    id = map[columnId] as int;
    content = map[columnContent] as String;
    title = map[columnTitle] as String;
    time = map[columnTime] as String;
  }

  int id;

  String content;
  String title;
  String time;

  /// 转成日志
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnContent: content,
      columnTitle: title,
      columnTime: time
    };
    if (id != null) {
      map[columnId] = id;
    }

    return map;
  }

  @override
  String toString() {
    return 'Note{id: $id, content: $content, title: $title, time: $time}';
  }
}

class NoteProvider {
  static Database db;
  static Database dbpage;

  static Future open() async {
    String path = "simple_note.db";
    db = await openDatabase(path, version: 6,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table $tableNote(
          $columnId integer primary key autoincrement,
          $columnContent text,
          $columnTitle text,
          $columnTime text
        )
        ''');
      await db.execute('''
        create table $tableCollect(
          $columnId integer primary key autoincrement,
          $columnContent text,
          $columnTitle text,
          $columnTime text
        )
        ''');
    });
    String pathPage = "simple_page.db";
    dbpage = await openDatabase(pathPage, version: 6,
        onCreate: (Database dbpage, int version) async {
      await dbpage.execute('''
        create table $tableCollect(
          $columnId integer primary key autoincrement,
          $columnContent text,
          $columnTitle text,
          $columnTime text
        )
        ''');
    });
  }

  // 笔记插入
  static Future<Note> insert(Note note) async {
    note.id = await db.insert(tableNote, note.toMap());
    print(note.toString());
    return note;
  }

  //网页收藏插入
  static Future<Note> insertWebPage(Note note) async {
    note.id = await dbpage.insert(tableCollect, note.toMap());
    print(note.toString());
    return note;
  }

  // 查询笔记-id
  static Future<Note> getNote(int id) async {
    List<Map> maps = await db.query(tableNote,
        columns: [columnId, columnContent, columnTitle, columnTime],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  // 查询笔记-time
  static Future<Note> getNoteByTime(String time) async {
    List<Map> maps = await db.query(tableNote,
        columns: [columnId, columnContent, columnTitle, columnTime],
        where: '$columnTime = ?',
        whereArgs: [time]);
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  // 查询网页-url
  static Future<Note> getWebPageByTime(String content) async {
    List<Map> maps = await dbpage.query(tableCollect,
        columns: [columnId, columnContent, columnTitle, columnTime],
        where: '$columnContent = ?',
        whereArgs: [content]);
    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  // 查询所有笔记
  static Future<List<Note>> getNoteAll() async {
    List<Map> maps = await db.query(
      tableNote,
      columns: [columnId, columnContent, columnTitle, columnTime],
    );
    if (maps.isNotEmpty) {
      return List<Note>.from(maps.map((x) => Note.fromMap(x)));
    } else
      return null;
  }

  // 查询所有收藏网页
  static Future<List<Note>> getWebPageAll() async {
    List<Map> maps = await dbpage.query(
      tableCollect,
      columns: [columnId, columnContent, columnTitle, columnTime],
    );
    if (maps.isNotEmpty) {
      return List<Note>.from(maps.map((x) => Note.fromMap(x)));
    } else
      return null;
  }

  // 删除笔记
  static Future<int> delete(int id) async {
    return await db.delete(tableNote, where: '$columnId = ?', whereArgs: [id]);
  }

  // 删除收藏网页
  static Future<int> deleteWebPage(int id) async {
    return await dbpage
        .delete(tableCollect, where: '$columnId = ?', whereArgs: [id]);
  }

  // 更新
  static Future<int> update(Note note) async {
    return await db.update(tableNote, note.toMap(),
        where: '$columnId = ?', whereArgs: [note.id]);
  }

  // 关闭
  static Future close() async {
    db.close();
    dbpage.close();
  }
}
