import 'package:flutter/material.dart';
import 'package:test_indoor_app/constant.dart';
import 'package:test_indoor_app/screens/discover_screen.dart';
import 'package:test_indoor_app/screens/registration_screen.dart';


class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

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
                  BuildTextField('Email', (value) {
                    this.email = value;
                  }, TextInputType.emailAddress),
                  SizedBox(
                    height: 20,
                  ),
                  BuildTextField('Password', (value) {
                    this.password = value;
                  }, TextInputType.visiblePassword),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Forgot Password
                    },
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
                onTap: () {
                  print('$email $password');
                  Navigator.pushNamed(context, DiscoverScreen.id);
                },
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
                onTap: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
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
}

class BuildTextField extends StatelessWidget {
  BuildTextField(this.hintText, this.onChanged, this.keyboardType);

  final String hintText;
  final Function onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: kAccentColor,
      obscureText: hintText == 'Password' ? true : false,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        fillColor: Color(0xFFFBFAFF),
        filled: true,
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

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 7),
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
