
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

DatabaseClient dbClient;

class DatabaseClient{
  Database _db;

  Future create() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "jobbag.db");
    await deleteDatabase(path);
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate, readOnly: false);
    return theDb;
  }

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await create();
    return _db;
  }

  Future _onCreate(Database db, int version) async {
  }

}

