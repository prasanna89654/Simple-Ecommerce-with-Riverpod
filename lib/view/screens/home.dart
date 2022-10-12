// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lafyuu/view/extras/notification_screen.dart';
import 'package:lafyuu/view/screens/account_screen.dart';
import 'package:lafyuu/view/screens/cart_screen.dart';
import 'package:lafyuu/view/screens/favourite_screen.dart';
import 'package:lafyuu/view/screens/login.dart';
import 'package:lafyuu/view/screens/main_screen.dart';
import 'package:lafyuu/view/screens/search_screen.dart';
import 'package:lafyuu/view/widgets/custom_list.dart';
import 'package:lafyuu/view/widgets/listmaker.dart';
// import 'package:lafyuu/view/widgets/recom.dart';

import '../widgets/textbox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final screens = [
    mscreen(),
    search(),
    CartScreen(),
    account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => LoginScreen(),
      //     ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _currentIndex == 1
            ? AppBar(
                title: Text("Explore"),
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(65.0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  actions: [
                    // SizedBox(
                    //   height: 12,
                    // ),
                    Container(
                      height: 90,
                      width: 423,
                      // color: Colors.red,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              width: 14,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              height: 55,
                              width: 230,
                              // color: Colors.blue,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => search(),
                                      ));
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.search),
                                    SizedBox(width: 20),
                                    Text(
                                      "Search Products",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                                height: 100,
                                width: 50,
                                // color: Colors.green,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FavoriteScreen(),
                                          ));
                                    },
                                    icon: Image.asset(
                                        'assets/images/heart.png'))),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                                height: 100,
                                width: 50,
                                // color: Colors.blue,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => nscreen(),
                                        ));
                                  },
                                  icon: Image.asset('assets/images/noti.png'),
                                  iconSize: 40,
                                ))
                          ]),
                    ),
                  ],
                ),
              ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Explore',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
              // backgroundColor: Colors.red,
            ),
          ],
          // backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,

          // unselectedLabelStyle: TextStyle(
          //   color: Colors.black,
          // ),
          selectedItemColor: Colors.blue,
          // unselectedItemColor: Colors.black,
          // selected
          iconSize: 30,
          // fixedColor: Colors.red,
          // backgroundColor: Colors.blue,
          onTap: _onItemTapped,
          // unselectedFontSize: 14,
          // selectedFontSize: 17,
          showUnselectedLabels: true,

          // unselectedItemColor: Colors.white,

          elevation: 5,
        ));
  }
}
