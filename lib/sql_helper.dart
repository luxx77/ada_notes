import 'dart:developer';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  
  static Future<sql.Database> openMyDatabase() async {
    final database = await sql.getDatabasesPath();
    return await sql.openDatabase(path.join(database, 'information.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE user_favorites(id INTEGER PRIMARY KEY, num TEXT, des TEXT, date TEXT, count INTEGER)');
    }, version: 1,);
    
  }

  static Future<void> insert(String table, Map<String, Object> data,) async {
    final db = await DBHelper.openMyDatabase();
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, Object?>>> getData(String table) async {
    final db = await DBHelper.openMyDatabase();
    return await db.query(table);
  }

  static Future<void> uptade(
      String table, Map<String, Object> data, int id) async {
    final db = await DBHelper.openMyDatabase();
    await db.update(table, data, where: 'id = $id');
  }

  static Future<void> deleteFavorite(String table, int id) async {
    final db = await DBHelper.openMyDatabase();
    await db.delete(table, where: 'id = $id');
    log('$id was deleted');
  }
}
