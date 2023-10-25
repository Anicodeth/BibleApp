import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();

  // Set the databaseFactory to databaseFactoryFfi
  databaseFactory = databaseFactoryFfi;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final database = await openDatabase(
              'my_database.db',
              version: 1,
              onCreate: (Database db, int version) async {
                await db.execute(
                    'CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)');
              },
            );

            await database.insert('my_table', {'name': 'John Doe'});
            final results = await database.query('my_table');

            print(results);
          },
          child: Text('Perform Database Operations'),
        ),
      ),
    );
  }
}
