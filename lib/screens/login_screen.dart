import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Image(
              image: AssetImage('images/logo.png'),
              width: 50,
            ),
            Text(
              'Indoor',
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
