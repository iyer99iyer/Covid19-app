import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
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
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                buildTextField('Email'),
                SizedBox(
                  height: 20,
                ),
                buildTextField('Password'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Forgot Password?',
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            CustomButton(text: 'Login')
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Container(
      color: Colors.black12,
      child: TextField(
        obscureText: hintText == 'Password' ? true : false,
        decoration: InputDecoration(
            prefixIcon:
                Icon(hintText == 'Password' ? Icons.lock : Icons.account_box),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18.0,
            ),
            border: OutlineInputBorder()),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFF00CA9D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),
      ),
    );
  }
}
