import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:warungku/models/barang.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

//inisialisasi db
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'warung.db';
    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE barang (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        namaBarang TEXT,
        stock TEXT
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
    var mapList = await db.query('barang', orderBy: 'namaBarang');
    return mapList;
  }

  //membuat data
  Future<int> insert(Barang object) async {
    Database db = await this.database;
    int count = await db.insert('barang', object.toMap());
    return count;
  }

  //update data
  Future<int> update(Barang object) async {
    Database db = await this.database;
    int count = await db.update('barang', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete data
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('barang', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //mendapatkan list barang
  Future<List<Barang>> getBarang() async {
    var barangMapList = await select();
    int count = barangMapList.length;
    List<Barang> listbarang = List<Barang>();
    for (int i = 0; i < count; i++) {
      listbarang.add(Barang.fromMap(barangMapList[i]));
    }
    return listbarang;
  }
}
