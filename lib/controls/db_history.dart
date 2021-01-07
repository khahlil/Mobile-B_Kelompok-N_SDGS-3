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
    if (_dbHelper == null) _dbHelper = DbHistory._createObject();
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'history.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initDb();
    return _database;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        hari TEXT,
        date TEXT,
        time TEXT
      )
    ''');
  }

  Future<Database> dropDb() async {
    Database db = await this.database;
    await db.delete('history');
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('history', orderBy: 'id');
    return mapList;
  }

//create databases
  Future<int> insert(History object) async {
    Database db = await this.database;
    int count = await db.insert('history', object.toMap());
    return count;
  }

//update databases
  Future<int> update(History object) async {
    Database db = await this.database;
    int count = await db.update('history', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('history', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<History>> getHistoryList() async {
    var historyMapList = await select();
    int count = historyMapList.length;
    List<History> historyList = List<History>();
    for (int i = 0; i < count; i++)
      historyList.add(History.fromMap(historyMapList[i]));
    return historyList;
  }
}
