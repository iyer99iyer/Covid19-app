import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_indoor_app/constant.dart';
import 'package:test_indoor_app/screens/city_profile_screen.dart';
import 'package:test_indoor_app/screens/city_profile_sliver_screen.dart';
import 'package:test_indoor_app/screens/discover_screen.dart';
import 'package:test_indoor_app/screens/maps_screen.dart';

class IndoorTabBar extends StatefulWidget {
  static String id = 'indoor_tab_bar';

  @override
  _IndoorTabBarState createState() => _IndoorTabBarState();
}

class _IndoorTabBarState extends State<IndoorTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 20,
        shadowColor: kAccentColor,
        child: TabBar(
          isScrollable: false,
          controller: _tabController,
          indicatorColor: kAccentColor,
          unselectedLabelColor: Colors.grey,
          labelColor: kAccentColor,
          tabs: <Widget>[
            Tab(
              text: 'Discover',
              icon: Icon(
                Icons.near_me,
                size: 30,
              ),
            ),
            Tab(
              text: 'Map',
              icon: Icon(Icons.public, size: 30),
            ),
            Tab(
              text: 'Profile',
              icon: Icon(Icons.perm_identity),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController  ,
      physics: new NeverScrollableScrollPhysics(),
      children: <Widget>[
        DiscoverScreen(),
        MapsScreen(),
        CityProfileSliverScreen(),
      ]),
    );
  }
}
