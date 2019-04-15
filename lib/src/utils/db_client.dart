
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

DatabaseClient dbClient;

class DatabaseClient{
  Database _db;


  //region SQLITE SCRIPTS

  final _createUserTableSQL = """
  CREATE TABLE user(
    id INTEGER PRIMARY KEY,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    name TEXT,
    nick_name TEXT NOT NULL,
    age INTEGER,
    resume TEXT,
    avatar TEXT
  );
  """;

  final _createCountryTableSQL = """
  CREATE TABLE country(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
  );
  """;

  final _createRoosterTableSQL = """
  CREATE TABLE rooster(
    id INTEGER PRIMARY KEY,
    country_id INTEGER,
    name TEXT,
    nick_name TEXT NOT NULL,
    age INTEGER,
    resume TEXT,
    avatar TEXT,
    FOREIGN KEY (country_id) REFERENCES country(id)
  );
  """;

  final _createBattleTableSQL = """
  CREATE TABLE battle(
    id INTEGER PRIMARY KEY,
    title TEXT,
    rooster_one_id INTEGER,
    rooster_two_id INTEGER,
    winner_id INTEGER,
    date TEXT,
    location TEXT,
    video_path TEXT,
    tournament_id INTEGER NOT NULL,
    FOREIGN KEY (tournament_id) REFERENCES tournament(id),
    FOREIGN KEY (rooster_one_id) REFERENCES rooster(id),
    FOREIGN KEY (rooster_two_id) REFERENCES rooster(id),
    FOREIGN KEY (winner_id) REFERENCES rooster(id)
  );
  """;

  final _createTournamentTableSQL = """
  CREATE TABLE tournament(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES country(id)
  );
  """;

  final _createCommentTableSQL = """
  CREATE TABLE comment(
    id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    battle_id INTEGER NOT NULL,
    body TEXT,
    like INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(battle_id) REFERENCES battle(id)
  );
  """;

  final _createUserTournamentFollowTableSQL = """
  CREATE TABLE user_tourn_follow(
    user_id TEXT PRIMARY KEY,
    tournament_id TEXT,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(tournament_id) REFERENCES tournament(id)
  );
 """;

  final _createUserRoosterFollowTableSQL = """
  CREATE TABLE user_rooster_follow(
    user_id TEXT PRIMARY KEY,
    rooster_id TEXT,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(rooster_id) REFERENCES rooster(id)
  );
 """;
  //endregion


  Future create() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "jobbag.db");
    //await deleteDatabase(path);
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
    await db.execute(_createCountryTableSQL);
    await db.execute(_createUserTableSQL);
    await db.execute(_createRoosterTableSQL);
    await db.execute(_createTournamentTableSQL);
    await db.execute(_createBattleTableSQL);
    await db.execute(_createCommentTableSQL);
    await db.execute(_createUserTournamentFollowTableSQL);
    await db.execute(_createUserRoosterFollowTableSQL);
  }

}

