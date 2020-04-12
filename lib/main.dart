import 'package:flutter/material.dart';
import 'package:test_indoor_app/constant.dart';
import 'package:test_indoor_app/screens/discover_screen.dart';
import 'package:test_indoor_app/screens/login_screen.dart';
import 'package:test_indoor_app/screens/registration_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiscoverScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DiscoverScreen.id: (context) => DiscoverScreen()
      },
      theme: ThemeData(accentColor: kAccentColor, primaryColor: kAccentColor),
    );
  }
}
