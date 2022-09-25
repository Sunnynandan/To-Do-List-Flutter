import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class Data {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    final sqldb = await openDatabase(path.join(dbPath, 'data.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE list_data(id INTEGER PRIMARY KEY autoincrement,txt TEXT)');
    }, version: 1);
    return sqldb;
  }

  static Future<void> insertData(String text, bool isSelected) async {
    final db = await database();

    if (db != null) {
      await db.insert(
          'list_data',
          {
            'txt': text,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      database();
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await database();

    if (db != null) {
      return await db.query('list_data');
    } else {
      return [];
    }
  }

  static Future<void> delete(String text) async {
    final db = await database();
    await db.delete('list_data', where: "txt = ?", whereArgs: [text]);
  }

  static Future<void> deleteAll() async {
    final db = await database();
    await db.delete('list_data');
  }

  static Future<void> update(String newText, String oldText) async {
    final db = await database();
    await db.update('list_data', {'txt': newText},
        where: "txt = ?", whereArgs: [oldText]);
  }
}
