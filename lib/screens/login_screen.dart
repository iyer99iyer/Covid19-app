import 'package:flutter/material.dart';
import 'package:test_indoor_app/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 100.0, right: 20, left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/logo.png'),
                    width: 60,
                  ),
                  Text(
                    'Indoor',
                    style: TextStyle(color: Colors.black54, fontSize: 30),
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
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: CustomButton(text: 'Login'),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: CustomButton(text: 'Google'),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Not a member yet?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 24, color: kAccentColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      cursorColor: kAccentColor,
      obscureText: hintText == 'Password' ? true : false,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        fillColor: Color(0xFFFBFAFF),
        filled: true,
        hoverColor: kAccentColor,
        // border: InputBorder.none,
        focusColor: kAccentColor,
        prefixIcon: Icon(
          hintText == 'Password' ? Icons.lock : Icons.perm_identity,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
      decoration: BoxDecoration(
        color: kAccentColor,
        borderRadius: BorderRadius.circular(100),
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
