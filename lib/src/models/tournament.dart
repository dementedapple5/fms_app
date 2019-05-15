import 'package:fms_app/src/models/battle.dart';
import 'package:fms_app/src/models/country.dart';
import 'package:fms_app/src/models/rooster.dart';

class Tournament {
  int id;
  List<Rooster> roosters;
  List<Battle> battles;
  Country country;
  String name;
  String description;
  String posterUrl;


  Tournament.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    description = map['description'];
    posterUrl = map['posterUrl'];
    id = map['id'];
  }


  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name' : name,
      'description' : description,
      'posterUrl' : posterUrl,
      'country_id' : country.code
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }


}