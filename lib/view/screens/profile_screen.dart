import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lafyuu/view/widgets/app_bar.dart';
import 'package:lafyuu/view/widgets/profile_maker.dart';
import 'package:lafyuu/view/widgets/style.dart';

class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: autoappbar(text: 'Profile')),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              height: 100,
              // color: Colors.red,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 98.0,
                      height: 98.0,
                      // color: Colors.blue,
                      decoration: new BoxDecoration(
                          // color: Colors.green,
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/profile1.png")))),
                  SizedBox(width: 10),
                  Container(
                      height: 40,
                      width: 280,
                      // color: Colors.blue,
                      child: style(text: 'Sample Name', fontsize: 25)),

                  // ClipRRect(
                  //     child: SizedBox.fromSize(
                  //   size: Size.fromRadius(48), // Image radius
                  //   child: Image.asset(
                  //     'assets/images/profile1.png',
                  //     height: 10,
                  //     width: 10,
                  //   ),
                  // ))
                ],
              )),
          SizedBox(height: 10),
          Container(
              height: 500,
              // color: Colors.green,
              child: ListView(
                // padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                children: [
                  pmaker(
                    image: "assets/images/gender.png",
                    text: 'Gender',
                    text1: 'Male',
                  ),
                  pmaker(
                    image: "assets/images/calendar.png",
                    text: 'Birthday',
                    text1: '12-12-2000',
                  ),
                  pmaker(
                    image: "assets/images/email.png",
                    text: 'Email',
                    text1: 'poudell789@gmail.com',
                  ),
                  pmaker(
                    image: "assets/images/call.png",
                    text: 'Phone Number',
                    text1: '98822843462',
                  ),
                  pmaker(
                    image: "assets/images/lock.png",
                    text: 'Password',
                    text1: '.............',
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
