import 'package:flutter/material.dart';
import 'package:fms_app/src/models/country.dart';
import 'package:fms_app/src/models/rooster.dart';
import 'package:fms_app/src/repositories/country_repository.dart';
import 'package:fms_app/src/repositories/rooster_repository.dart';
import 'package:fms_app/src/ui/main_page.dart';

void main() => runApp(MyApp());

int counter = 0;

class MyApp extends StatelessWidget {

  CountryRepository cr = CountryRepository();
  RoosterRepository rr = RoosterRepository();
  
  void insertRooster() async {
    Country country = await cr.fetchCountryById(1);
    rr.insertRooster(Rooster(country, 'Daniel Ribbas', 'Dani', 19, 'Mejor flow de la Argentina', ''));
    rr.insertRooster(Rooster(country, 'Mauricio', 'Wos', 21, 'Campeon mundial', ''));
  }


  @override
  Widget build(BuildContext context) {
    
    if (counter == 0){
      rr.fetchRoosters();
      counter++;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rooster Edge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ProductSans'
      ),
      home: MainPage(title: 'Rooster Edge'),
    );
  }

}

