import 'package:flutter/material.dart';
import 'package:test_indoor_app/screens/my_visit_screen.dart';
import 'package:test_indoor_app/screens/suspected_area_screen.dart';

import '../constant.dart';

class CityProfileScreen extends StatefulWidget {
  static String id = 'city_profile_screen';

  @override
  _CityProfileScreenState createState() => _CityProfileScreenState();
}

class _CityProfileScreenState extends State<CityProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(350),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              AppBarCustom()
            ],
          ),

          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            indicatorColor: kAccentColor,
            unselectedLabelColor: Colors.grey,
            labelColor: kAccentColor,
            tabs: <Widget>[
              Tab(
                child: Text(
                  'SUSPECTED AREA',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  'MY VISIT',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        SuspectedAreaScreen(),
        MyVisitScreen(),
      ]),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF3C2525),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: MediaQuery.of(context).size.width/2.7,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Indore',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 10),
        Text(
          'MP, India',
          style: TextStyle(fontSize: 11, color: Colors.grey),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 60,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'SUSPECTED',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Text(
                    '108',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Quicksand',
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 60,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'QUARANTINE',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Text(
                    '23',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Quicksand',
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 60,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'ISOLATED',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Text(
                    '89',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Quicksand',
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 60,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'OBERVATIONS',
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Text(
                    '259',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Quicksand',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
