import 'package:fms_app/src/models/tournament.dart';
import 'package:fms_app/src/utils/db_client.dart';
import 'package:sqflite/sqflite.dart';

class TournamentRepository{

  Future<Tournament> getTournaments() async {

    DatabaseClient dbClient = DatabaseClient();

    Database db = await dbClient.db;

    List<Tournament> tournaments;

    await db.query('tournaments').then((results) {
      for (Map<String, dynamic> result in results) {
        tournaments.add(Tournament.fromMap(result));
      }
    });




  }

}