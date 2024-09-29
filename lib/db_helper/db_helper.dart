import 'dart:io';
import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Variable
  static const dbName = 'myDatabase.db';
  static const dbVersion = 1;
  static const dbtableName = 'myTable';
  static const columnId = 'id';
  static const columnName = "name";

  // Constructor
  static final DatabaseHelper instance = DatabaseHelper();

  // Database initialization
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDB();
    return _database;
    //   if (_database != null) {
    //     return _database;
    //   }
    //   _database = await initDB();
    //   return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  //* Creates the database table using an SQL statement.
  //
  //* The SQL statement is as follows:

  Future onCreate(Database db, int version) async {
    db.execute('''
    CREATE TABLE $dbtableName (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
    )

''');
  }

  //* insert method
  insertdata(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(dbtableName, row);
  }
  //*   read/query method

  Future<List<Map<String, dynamic>>> queryDatabase() async {
    Database? db = await instance.database;
    return await db!.query(dbtableName);
  }

  //*   update method

  Future<int> updateData(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(dbtableName, row, where: "$columnId = ?", whereArgs: [id]);
  }

  //*   delete method
  Future<int> deleteData(int id) async {
    Database? db = await instance.database;
    return await db!
        .delete(dbtableName, where: "$columnId = ?", whereArgs: [id]);
  }
}
