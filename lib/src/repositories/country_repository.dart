import 'package:fms_app/src/models/country.dart';
import 'package:fms_app/src/utils/db_client.dart';
import 'package:sqflite/sqlite_api.dart';

class CountryRepository {

  Future<Country> fetchCountryById(int countryId) async {

  }

  Future<int> insertCountry(Country country) async {
    DatabaseClient dbClient = DatabaseClient();
    Database db = await dbClient.db;
    int id = await db.insert('country', country.toMap());
    return id;
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