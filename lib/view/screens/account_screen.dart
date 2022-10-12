import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lafyuu/view/screens/login.dart';
import 'package:lafyuu/view/screens/profile_screen.dart';

class account extends StatefulWidget {
  account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: 20),
            Container(
              width: double.infinity,
              // color: Colors.green,
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
              child: const Text(
                'Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 300,
                // color: Colors.red,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/profile.png',
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => profile(),
                            ));
                      },
                    ),
                    const SizedBox(height: 3),
                    ListTile(
                      title: const Text('Order',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onTap: () {},
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/order.png',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    ListTile(
                      title: const Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/address.png',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    ListTile(
                      title: const Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/Payment.png',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    ListTile(
                      title: const Text(
                        'LogOut',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        BackdropFilter alert = BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                            child: AlertDialog(
                                title: Text("LogOut"),
                                content: Text("Are you sure to logout?"),
                                actions: [
                                  TextButton(
                                    // FlatButton widget is used to make a text to work like a button
                                    style: TextButton.styleFrom(
                                        // backgroundColor: Colors.blue,

                                        ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }, // function used to perform after pressing the button
                                    child: Text(
                                      'cancel',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        // backgroundColor: Colors.blue,
                                        ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    child: Text(
                                      'ok',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ]));
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 30,
                          // s,
                          // minHeight: 40,
                          // minWidth: 40,
                        ),
                        child: Image.asset(
                          'assets/images/sign-out.png',
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
