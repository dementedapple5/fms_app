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
    int id = await cr.insertCountry(Country('Argentina', 'AR'));
    Country country = await cr.fetchCountryById(id);
    rr.insertRooster(Rooster(country, 'Daniel Ribbas', 'Dani', 19, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'https://www.elestilolibre.com/wp-content/uploads/2019/03/Dani.png'));
    rr.insertRooster(Rooster(country, 'Mauricio', 'Wos', 21, 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'https://vignette.wikia.nocookie.net/rap/images/a/a7/Wosito_fachuli.jpg/revision/latest?cb=20181015050046&path-prefix=es'));
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

