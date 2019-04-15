import 'package:fms_app/src/models/country.dart';
import 'package:fms_app/src/utils/db_client.dart';
import 'package:sqflite/sqlite_api.dart';

class CountryRepository {
  
  Future<Country> fetchCountryById(int countryId) async {
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    Country country;
    country = await db.query('country', where: 'id = ?', whereArgs: [countryId]).then((result) => Country.fromMap(result[0]));
    return country;
  }

  void insertCountry(Country country) async {
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    db.insert('country', country.toMap());
  }

  Future<List<Country>> fetchCountries() async {
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    List<Country> countries = List();
    await db.query('country').then((results) {
      for (Map result in results) {
        countries.add(Country.fromMap(result));
      }
    });
    print(countries.toString());
    return countries;
  }
  
}