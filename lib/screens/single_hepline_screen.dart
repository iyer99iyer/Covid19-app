import 'package:flutter/material.dart';
import 'package:test_indoor_app/modal/discover_modal.dart';

class HelplineScreen extends StatelessWidget {

  final Discover discover;

  HelplineScreen(this.discover);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(discover.serviceType)
      ),
    );
  }
}