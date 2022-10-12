// import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/textbox.dart';
import 'login.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String? gender;

  DateTime date = DateTime(2022, 8, 18);
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validatePhone(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  DateTime? birthdate;

  bool validateDate(String value) {
    const pattern = r'^(0[1-9]|1[0-9]|2[0-9]|3[01])-/.-/.$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Center(
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/Icon.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Let's Get Started ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Create a new account',
                      style: TextStyle(fontSize: 14)),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    decoration: textDecoration.copyWith(
                      labelText: "Full Name",
                      prefixIcon: const Icon(Icons.people),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: textDecoration.copyWith(
                        labelText: "Your Email",
                        prefixIcon: const Icon(
                          Icons.email,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      } else if (validateEmail(value) == false)
                        return 'Please enter Valid email';
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: textDecoration.copyWith(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      controller: _pass,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Password';
                        } else if (value.length < 5) {
                          return 'Password too Small';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: textDecoration.copyWith(
                      labelText: "Password Again",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value != _pass.text) {
                        return "Password doesn't match";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      // color: Colors.red,
                      height: 50,
                      width: double.infinity,
                      child: Row(children: [
                        Text(
                          "Gender :",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          height: 50,
                          width: 129,
                          // color: Colors.blue,
                          child: RadioListTile(
                            title: Text("Male"),
                            value: "male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 149,
                          // color: Colors.green,
                          child: RadioListTile(
                            title: Text("Female"),
                            value: "female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                      ])),

                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: textDecoration.copyWith(
                        labelText: "Phone Number",
                        prefixIcon: const Icon(
                          Icons.phone_android,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter phone number';
                      }
                      // } else if (value.length != 10)
                      //   return 'Enter 10 digit Phone number';
                      else if (validatePhone(value) == false)
                        return 'Enter 10 digit number only';

                      return null;
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Row(children: [
                      Text(
                        "BirthDate :  ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          // height: 40,
                          width: 144,
                          // color: Colors.blue,
                          child: Text("${date.year}/${date.month}/${date.day}",
                              style: TextStyle(fontSize: 20))),
                      ElevatedButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: date);

                            if (newDate == null) return;
                            setState(() => date = newDate);
                          },
                          child: Text("Choose"))
                    ]),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signup();
                            }
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ))
                              }),
                  ])),
                ]),
              ))),
    );
  }
}
