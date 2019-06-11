import 'package:flutter/material.dart';
import 'package:fms_app/src/providers/login_provider.dart';
import 'package:fms_app/src/utils/locator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(

      builder: (context) => locator<LoginProvider>(),
      child: Consumer<LoginProvider>(
        builder: (BuildContext context, LoginProvider value, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Tinkering', style: Theme.of(context).textTheme.display1),
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 100.0),

                    Image.asset('assets/inspiration.png', width: 200.0, height: 200.0),

                    SizedBox(height: 40.0),

                    //Username
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                    ),

                    SizedBox(height: 20.0),

                    //Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                      ),
                    ),

                    SizedBox(height: 30.0),

                    MaterialButton(
                      child: Text("Login", style: Theme.of(context).textTheme.display2),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      elevation: 3.0,
                      onPressed: () {},
                    ),

                    SizedBox(height: 15.0),

                    MaterialButton(
                      child: Text("Sign In with Apple", style: Theme.of(context).textTheme.display2),
                      color: Colors.black,
                      textColor: Colors.white,
                      elevation: 3.0,
                      onPressed: () {},
                    )

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
