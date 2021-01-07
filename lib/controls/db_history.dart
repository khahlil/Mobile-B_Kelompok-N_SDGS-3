import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:e_Masker/models/m_history.dart';

class DbHistory {
  static DbHistory _dbHelper;
  static Database _database;

  DbHistory._createObject();

  factory DbHistory() {
    if (_dbHelper == null) {
      _dbHelper = DbHistory._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'masker.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru dengan nama masker
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE masker (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('masker', orderBy: 'name');
    return mapList;
  }

//create databases
  Future<int> insert(History object) async {
    Database db = await this.database;
    int count = await db.insert('masker', object.toMap());
    return count;
  }

//update databases
  Future<int> update(History object) async {
    Database db = await this.database;
    int count = await db.update('masker', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('masker', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<History>> getHistoryList() async {
    var maskerMapList = await select();
    int count = maskerMapList.length;
    List<History> maskerList = List<History>();
    for (int i = 0; i < count; i++) {
      maskerList.add(History.fromMap(maskerMapList[i]));
    }
    return maskerList;
  }
}
