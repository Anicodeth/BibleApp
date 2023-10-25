import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/bible.dart';


class DatabaseHelper {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'bible.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Bibles(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  // Insert a new Bible
  Future<int> insertBible(String name) async {
    final Database db = await initializeDB();
    return db.insert(
      'Bibles',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



  // Update a Bible
  Future<int> updateBible(int id, String newName) async {
    final Database db = await initializeDB();
    return db.update(
      'Bibles',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete a Bible
  Future<int> deleteBible(int id) async {
    final Database db = await initializeDB();
    return db.delete(
      'Bibles',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
