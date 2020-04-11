import 'package:flutter/material.dart';
import 'package:test_indoor_app/constant.dart';
import 'package:test_indoor_app/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name;
  String mobile;
  String email;
  String password;

  Function onchanged;

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
                  buildTextField('Name', Icons.perm_identity, (value) {
                    this.name = value;
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField('Phone number', Icons.phone, (value) {
                    this.mobile = value;
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField('Email', Icons.email, (value) {
                    this.email = value;
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField('Password', Icons.lock, (value) {
                    this.password = value;
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print(
                      'name => $name \n phone => $mobile \n email => $email \n password => $password');
                },
                child: CustomButton(text: 'Register'),
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
                'Already member?',
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
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, color: kAccentColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, IconData icon, Function onChanged) {
    return TextField(
      onChanged: onChanged,
      cursorColor: kAccentColor,
      obscureText: hintText == 'Password' ? true : false,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(
        fillColor: Color(0xFFFBFAFF),
        filled: true,
        prefixIcon: Icon(
          icon,
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
