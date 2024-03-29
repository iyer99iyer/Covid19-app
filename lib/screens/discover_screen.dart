import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:test_indoor_app/constant.dart';
import 'dart:convert';

import 'package:test_indoor_app/modal/discover_modal.dart';
import 'package:test_indoor_app/screens/single_hepline_screen.dart';

class DiscoverScreen extends StatefulWidget {
  static String id = 'discover_screen';

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  Future<List<Discover>> _getDiscover() async {
    var data = await http.get(
        'https://my-json-server.typicode.com/iyer99iyer/gridViewPaceholder/post#');

    var jsonData = json.decode(data.body);

    List<Discover> discoverItems = [];

    Discover discover;

    // for (var u in jsonData) {

    //   discover = Discover(
    //     index: u['index'],
    //     serviceType: u['serviceType'],
    //     distance: u['distance'],
    //     stars: u['stars'],
    //     picture: u['picture'],
    //   );
    //   discoverItems.add(discover);
    //   print(u['index']);
    //   //break;
    //   // if(u['index']==4){
    //   //   return discoverItems;
    //   // }

    // }
    print(discoverItems.length);

    discoverItems.add(Discover(
        index: 0,
        serviceType: 'Police Helpline',
        distance: 1.3,
        stars: 4.2,
        picture:
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'));
    discoverItems.add(Discover(
        index: 1,
        serviceType: 'Hospital Helpline',
        distance: 1.3,
        stars: 4.2,
        picture:
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'));
    discoverItems.add(Discover(
        index: 2,
        serviceType: 'Hospital Helpline',
        distance: 1.3,
        stars: 3.2,
        picture:
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg'));

    print(discoverItems.length);

    return discoverItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              //Menu Code
            },
            child: Icon(
              Icons.menu,
              size: 30,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Discover',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        actions: <Widget>[
          //Image(image: AssetImage('logo.png',),height: 5,),
          GestureDetector(
              onTap: () {
                print('filter Tapped');
                //filter code
              },
              child: Icon(
                Icons.filter_list,
                size: 30,
              )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
            future: _getDiscover(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return ListView.builder(
                  key: PageStorageKey("Left"),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              children: <Widget>[
                                Image.network(snapshot.data[index].picture),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data[index].serviceType,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            rating(snapshot.data[index].stars),
                                            Text(
                                              '  ${snapshot.data[index].stars}/5.0',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              '  |  ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              '${snapshot.data[index].distance.toString()} KM NEARBY',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HelplineScreen(snapshot.data[index])));
                        },
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }

  Widget rating(stars) {
    List<Widget> starRating = [];
    for (var i = 1; i <= stars; i++) {
      starRating.add(Icon(
        Icons.star,
        color: kAccentColor,
        size: 20,
      ));
    }
    for (var i = starRating.length; i < 5; i++) {
      starRating.add(Icon(
        Icons.star,
        color: Colors.grey,
        size: 20,
      ));
    }
    return Row(
      children: starRating,
    );
  }
}
