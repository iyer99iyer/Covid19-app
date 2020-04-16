import 'package:flutter/material.dart';
import 'package:test_indoor_app/constant.dart';
import 'package:test_indoor_app/screens/city_profile_screen.dart';
import 'package:test_indoor_app/screens/city_profile_sliver_screen.dart';
import 'package:test_indoor_app/screens/discover_screen.dart';
import 'package:test_indoor_app/screens/login_screen.dart';
import 'package:test_indoor_app/screens/maps_screen.dart';
import 'package:test_indoor_app/screens/my_visit_screen.dart';
import 'package:test_indoor_app/screens/registration_screen.dart';
import 'package:test_indoor_app/tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndoorTabBar(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        DiscoverScreen.id: (context) => DiscoverScreen(),
        IndoorTabBar.id: (context) => IndoorTabBar(),
        CityProfileScreen.id: (context) => CityProfileScreen(),
      },
      theme: ThemeData(accentColor: kAccentColor, primaryColor: kAccentColor),
    );
  }
}
