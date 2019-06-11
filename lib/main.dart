import 'package:flutter/material.dart';
import 'package:fms_app/src/ui/login.dart';
import 'package:fms_app/src/utils/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinkering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ProductSans',
        textTheme: TextTheme(
          subtitle: TextStyle(fontWeight: FontWeight.w700, fontSize: 26.0),
          title: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
          display1: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0, color: Colors.blue),
          display2: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
          headline: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
          subhead: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
          body1: TextStyle(fontSize: 16.0, color: Colors.grey),
          body2: TextStyle(fontSize: 16.0),
        )
      ),
      home: LoginPage(),
    );
  }

}

