import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlController extends GetxService {
  Database _database;

  Database get db {
    return _database;
  }

  Future<SqlController> init() async {
    await _initDatabase();
    return this;
  }

  @override
  void onClose() {
    _database.close();
    super.onClose();
  }

  Future<void> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    _database = await openDatabase(
      path,
      version: -100,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database database, int version) async {
    printInfo(info: 'creating database');
    await database.execute('''
      CREATE TABLE post
        (
          userid INTEGER NOT NULL,
          id     INTEGER NOT NULL PRIMARY KEY,
          title  TEXT NOT NULL,
          body   TEXT NOT NULL
        ); 
    ''');
  }

  Future<void> _onUpgrade(
      Database database, int oldVersion, int newVersion) async {}
}
