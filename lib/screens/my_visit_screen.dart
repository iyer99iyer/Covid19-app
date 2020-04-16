import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:test_indoor_app/modal/area_detail_modal.dart';
import 'dart:convert';

import '../constant.dart';

class MyVisitScreen extends StatefulWidget {
  @override
  _MyVisitScreenState createState() => _MyVisitScreenState();
}

class _MyVisitScreenState extends State<MyVisitScreen> {
  Future<List<AreaDetail>> _getDiscover() async {
    print('object');
    var data = await http.get('https://jsonplaceholder.typicode.com/photos');

    var jsonData = json.decode(data.body);

    List<AreaDetail> areas = [];

    AreaDetail area;

    for (var u in jsonData) {
      print(u['thumbnailUrl']);

      area = AreaDetail(
        id: u['id'],
        title: u['title'],
        pictureUrl: u['url'],
        thumbnailUrl: u['thumbnailUrl'],
      );
      areas.add(area);
      // print(areas.length);
      // print(u['id']);
      //break;

    }

    print(areas.length);

    return areas;
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getDiscover(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          //gridView
          return GridView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'images/logo.png',
                          image: snapshot.data[index].pictureUrl,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                '${snapshot.data[index].title}',
                                maxLines: 1,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  rating(4),
                                  Text('4.2/10'),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 3.0,
            ),
          );
        }

        return circularProgress();
      },
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
