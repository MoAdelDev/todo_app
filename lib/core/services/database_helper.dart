import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? database;
  static init() async {
    database = await openDatabase(
      'todo.db',
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE Todo (id INTEGER PRIMARY KEY,title TEXT,note TEXT,date TEXT,startTime TEXT,endTime TEXT,isCompleted INTEGER,color INTEGER,repeat TEXT,remind TEXT)');
        print('Database Created');
      },
      onOpen: (db) {
        print('Database Opened');
      },
    );
  }
}
