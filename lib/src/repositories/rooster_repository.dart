import 'package:fms_app/src/models/rooster.dart';
import 'package:fms_app/src/repositories/country_repository.dart';
import 'package:fms_app/src/utils/db_client.dart';
import 'package:sqflite/sqlite_api.dart';

class RoosterRepository{

  CountryRepository cr = CountryRepository();

  Future<Rooster> fetchRoosterById(int roosterId) async {
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    Rooster rooster;
    await db.query('rooster', where: 'id = ?', whereArgs: [roosterId]).then((result) {
       rooster = Rooster.fromMap(result[0]);
       cr.fetchCountryById(result[0]['country_id']).then((result) => rooster.country = result);
    });
    return rooster;
  }


  void insertRooster(Rooster rooster) async{
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    db.insert('rooster', rooster.toMap()).then((id) => print(id));
  }


  Future<List<Rooster>> fetchRoosters() async {
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    List<Rooster> roosters = List();
    await db.query('rooster').then((results) {
      for (Map result in results) {
        Rooster tempRooster = Rooster.fromMap(result);
         cr.fetchCountryById(result['country_id']).then((result){
          tempRooster.country = result;
          roosters.add(tempRooster);
        });
      }
    });

    print(roosters);
    return roosters;
  }
  
}