import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './database_helper.dart'; // Import your DatabaseHelper
import '../models/bible.dart'; // Import your model

void main() {
  group('DatabaseHelper Tests', () {
    late Database database;
    final dbHelper = DatabaseHelper();

    setUp(() async {
      // Open a test database (in-memory) before each test.
      database = await openDatabase(
        inMemoryDatabasePath,
        version: 1,
        onCreate: (db, version) {
          dbHelper._createTables(db); // Create tables for testing
        },
      );
    });

    tearDown(() async {
      // Close the database after each test.
      await database.close();
    });

    test('Insert Bible', () async {
      final bible = Bible(id: 1, name: 'Test Bible');
      await dbHelper.insertBible(bible);

      final retrievedBibles = await dbHelper.getAllBibles();
      expect(retrievedBibles.length, 1);
      expect(retrievedBibles.first.name, 'Test Bible');
    });

    // Write more test cases for other CRUD operations.
  });
}

