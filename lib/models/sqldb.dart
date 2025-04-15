import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null || !_db!.isOpen) {
      _db = await initialDb();
    }
    return _db;
  }

  initialDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'note.db');

    Database database = await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: 1,
    );
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "notes" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "title" TEXT NOT NULL,
        "note" TEXT NOT NULL,
        "color" INTEGER
      )
    ''');
    print("Database Created");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      await db.execute('ALTER TABLE notes ADD COLUMN color TEXT');
    }
    print("Database Upgraded");
  }

  Future<List<Map>> readData(String sql) async {
    Database? database = await db;
    if (database != null) {
      List<Map<String, dynamic>> response = await database.rawQuery(sql);
      return response;
    } else {
      return [];
    }
  }

  insertData(String sql) async {
    Database? database = await db;
    int response = await database!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? database = await db;
    int response = await database!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? database = await db;
    int response = await database!.rawDelete(sql);
    return response;
  }

  // myDeleteDatabase() async {
  //   try {
  //     String dbPath = await getDatabasesPath();
  //     String path = join(dbPath, 'note.db');
  //     await deleteDatabase(path);
  //     return 1;
  //   } catch (e) {
  //     print("Error while deleting the database: $e");
  //     return 0;
  //   }
  // }

  // الطريقة مختصرة بدون sqlflite
  Future<List<Map>> read(String table) async {
    Database? database = await db;
    if (database != null) {
      List<Map<String, dynamic>> response = await database.query(table);
      return response;
    } else {
      return [];
    }
  }

  insert(String table, Map<String, Object?> values) async {
    Database? database = await db;
    int response = await database!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object?> values, String where) async {
    Database? database = await db;
    int response = await database!.update(table, values, where: where);
    return response;
  }

  delete(String table, String deleteWhere) async {
    Database? database = await db;
    int response = await database!.delete(table, where: deleteWhere);
    return response;
  }
}
