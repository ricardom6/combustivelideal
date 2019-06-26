import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:combustivelideal/postoFormat.dart';

class Helper {
  static final Helper _instance = Helper.internal();

  Helper.internal();
  factory Helper() => _instance;
  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  Future<Database> initDb() async {
    final path = await getDatabasesPath();
    final pathDB = join(path, "posto.db");
    final String sql = "CREATE TABLE posto ("
    "cid INTEGER PRIMARY KEY,"
    "cnome TEXT,"
    "cpEt TEXT,"
    "cpGas TEXT,"
    "cdata TEXT,"
    "cresult TEXT)";
    return await openDatabase(pathDB, version: 1,
    onCreate: (Database db, int newerVersion)
    async {
      await db.execute(sql);
        });
  }
  Future<Posto> insert(Posto posto) async {
    Database dbPosto = await db;
    posto.id = await dbPosto.insert("posto", posto.toMap());
    return posto;
  }
  Future<Posto> selectById(int id) async {
    Database dbPosto = await db;
    List<Map> maps = await dbPosto.query("posto",
      columns: [
        "cid",
        "cnome",
        "cpEt",
        "cpGas",
        "cdata",
        "cresult"
        ],
      where: "cid = ?",
      whereArgs: [id]);
    if (maps.length > 0) {
      return Posto.fromMap(maps.first);
    } else{
      return null;
    }
  }
  Future<List> selectAll() async {
    Database dbPosto = await db;
    List list = await dbPosto.rawQuery("SELECT * FROM posto");
    List<Posto> lsPosto = List();
    for (Map m in list) {
      lsPosto.add(Posto.fromMap(m));
    }
    return lsPosto;
  }
  Future<int> update(Posto posto) async {
    Database dbPosto = await db;
    return await dbPosto.update("posto", posto.toMap(),
      where: "cid = ?",
      whereArgs: [posto.id]);
  }
  Future<int> delete(int id) async {
    Database dbPosto = await db;
    return await dbPosto.delete ("posto",
    where: "cid = ?",
    whereArgs: [id]);
  }
  Future close() async {
    Database dbPosto = await db;
    dbPosto.close();
  }
}



