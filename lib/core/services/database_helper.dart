import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? database;
  static init() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT, note Text, date Text, startTime Text, endTime Text, isCompleted bool, color int, repeat Text, remind Text)');
        print('Database Created');
      },
      onOpen: (db) {
        print('Database Opened');
      },
    );
  }
}
