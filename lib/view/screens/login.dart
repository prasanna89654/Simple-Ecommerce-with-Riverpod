import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lafyuu/view/extras/category.dart';
import 'package:lafyuu/view/screens/flash_sale_screen.dart';
import 'package:lafyuu/view/extras/product_not_found.dart';
import 'package:lafyuu/view/screens/home.dart';
import 'package:lafyuu/view/screens/main_screen.dart';
import 'package:lafyuu/view/screens/account_screen.dart';
import 'package:lafyuu/view/screens/profile_screen.dart';
import 'package:lafyuu/view/screens/search_screen.dart';

import 'package:lafyuu/view/screens/signup.dart';
import 'package:lafyuu/view/widgets/textbox.dart';

import '../extras/notification_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 120,
              ),
              Image.asset('assets/images/Icon.png'),
              SizedBox(
                height: 20,
              ),
              const Text('Welcome to Lafyuu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              const Text(
                'Sign in to continue',
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                decoration: textDecoration.copyWith(
                  labelText: "Your Email",
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (validateEmail(value) == false)
                    return 'Please enter Valid email';
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                  decoration: textDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length < 5) {
                      return 'Password too Small';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              const Text("OR"),
              SizedBox(
                height: 10,
              ),
              Container(
                  // height: 90,
                  // width: 80,
                  // child: ConstrainedBox(
                  //   constraints: BoxConstraints.expand(),
                  child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        maximumSize: Size(600, 100),
                        primary: Colors.blue,
                        side: BorderSide(color: Color(0xFFEBF0FF), width: 4)),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset(
                          'assets/images/googlelogo.png',
                          height: 40,
                          width: 20,
                        ),
                        SizedBox(width: 60),
                        Text('Login with Google',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        maximumSize: Size(600, 100),
                        primary: Colors.blue,
                        side: BorderSide(color: Color(0xFFEBF0FF), width: 4)),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Image.asset(
                          'assets/images/fblogo.png',
                          height: 40,
                          width: 20,
                        ),
                        SizedBox(width: 60),
                        Text('Login with Facebook',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Don't have a account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => signup(),
                                  ))
                            }),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
