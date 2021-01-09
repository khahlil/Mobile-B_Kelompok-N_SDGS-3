import 'package:path_provider/path_provider.dart';
import 'package:e_Masker/models/m_masker.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DbMasker {
  static DbMasker _dbHelper;
  static Database _database;

  DbMasker._createObject();

  factory DbMasker() {
    if (_dbHelper == null) _dbHelper = DbMasker._createObject();
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'masker.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initDb();
    return _database;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE masker (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        total INTEGER
      )
    ''');
  }

  Future<Database> dropDb() async {
    Database db = await this.database;
    await db.delete('masker');
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('masker', orderBy: 'id');
    return mapList;
  }

  Future<int> insert(Masker object) async {
    Database db = await this.database;
    int count = await db.insert('masker', object.toMap());
    return count;
  }

  Future<List<Masker>> getMaskerList() async {
    var maskerMapList = await select();
    int count = maskerMapList.length;
    List<Masker> maskerList = List<Masker>();
    for (int i = 0; i < count; i++)
      maskerList.add(Masker.fromMap(maskerMapList[i]));
    return maskerList;
  }
}
