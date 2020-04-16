import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
          
            options: MapOptions(center: LatLng(22.7196, 75.8577), minZoom: 5.0,),
            layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/iyer99iyer/ck902oiiv0ddz1im4ne4tgpct/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaXllcjk5aXllciIsImEiOiJjazkwMW01NnAwMTJ0M2xudDYwaWMyNzF0In0.zdiyZOkKfxZndcv2HTniYA",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiaXllcjk5aXllciIsImEiOiJjazkwMW01NnAwMTJ0M2xudDYwaWMyNzF0In0.zdiyZOkKfxZndcv2HTniYA',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
          CircleLayerOptions(
            circles: [
              CircleMarker(
                point: LatLng(22.7196, 75.8577),
                radius: 5.0,
                color: Colors.black,
                borderColor: Colors.red,
                borderStrokeWidth: 0,
              ),
              CircleMarker(
                point: LatLng(22.7196, 75.8577),
                radius: 80.0,
                color: Color(0x66ff3b48),
                borderColor: Colors.red,
                borderStrokeWidth: 0,
              ),
              CircleMarker(
                point: LatLng(22.7098, 75.8577),
                radius: 10.0,
                color: Color(0xffe3e5e8),
                borderColor: Colors.black,
                borderStrokeWidth: 5,
              ),
              CircleMarker(
                point: LatLng(22.7, 75.8577),
                radius: 10.0,
                color: Color(0xffe3e5e8),
                borderColor: Colors.black,
                borderStrokeWidth: 5,
              ),
              CircleMarker(
                point: LatLng(22.7098, 75.8377),
                radius: 10.0,
                color: Color(0xffe3e5e8),
                borderColor: Colors.black,
                borderStrokeWidth: 5,
              )
            ],
          )
        ]));
  }
}
