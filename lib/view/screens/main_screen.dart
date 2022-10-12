// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lafyuu/view/extras/category.dart';
import 'package:lafyuu/view/screens/flash_sale_screen.dart';
import 'package:lafyuu/view/extras/mega_screen.dart';
import 'package:lafyuu/view/screens/cart_screen.dart';
import 'package:lafyuu/view/screens/login.dart';
import 'package:lafyuu/view/screens/search_screen.dart';
import 'package:lafyuu/view/widgets/custom_list.dart';
import 'package:lafyuu/view/widgets/listmaker.dart';
import 'package:lafyuu/view/widgets/random_recom.dart';
import 'package:lafyuu/view/widgets/recom.dart';
// import 'package:lafyuu/view/widgets/recom.dart';
// import 'package:lafyuu/view/widgets/flashproducts.dart';

// import '../widgets/flashproducts.dart';
import '../../controller/riverpod_management.dart';
import '../widgets/textbox.dart';

class mscreen extends ConsumerWidget {
  const mscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watchflashproduct = ref.watch(flashproductsRiverpod);
    var readflashproduct = ref.read(flashproductsRiverpod);
    var watchmegaproduct = ref.watch(megaproductsRiverpod);
    var readmegaproduct = ref.read(megaproductsRiverpod);

    var readproduct = ref.read(productRiverpod);
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(children: [
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => flashscreen(),
                ));
          },
          child: Stack(
            children: [
              Container(
                // height: 250,
                width: 410,

                child: Image.asset(
                  'assets/images/off.png',
                  fit: BoxFit.fill,
                  // height: 190,
                  // width: 400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Super Flash Sale \n50% off ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    TimerCountdown(
                      timeTextStyle: TextStyle(color: Colors.white),
                      colonsTextStyle: TextStyle(color: Colors.white),
                      descriptionTextStyle: TextStyle(color: Colors.white),
                      format: CountDownTimerFormat.daysHoursMinutesSeconds,
                      endTime: DateTime.now().add(
                        Duration(
                          days: 5,
                          hours: 14,
                          minutes: 27,
                          seconds: 34,
                        ),
                      ),
                      onEnd: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            height: 150,
            width: 400,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 172),
                    RichText(
                      text: TextSpan(
                          text: 'More Category',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => category(),
                                      ))
                                }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // color: Coloamber,
                  height: 100,
                  // width: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomList(
                        textButton: "assets/images/dress.png",
                        text: "Night Dress",
                        press: () {},
                      ),
                      CustomList(
                        textButton: "assets/images/shirt.png",
                        text: "Man Shirt",
                        press: () {},
                      ),
                      CustomList(
                        textButton: "assets/images/tools.png",
                        text: "Equipments",
                        press: () {},
                      ),
                      CustomList(
                        textButton: "assets/images/handbag.png",
                        text: "Women Bag",
                        press: () {},
                      ),
                      CustomList(
                        textButton: "assets/images/sneakers.png",
                        text: "Men Shoes",
                        press: () {},
                      ),
                      CustomList(
                        textButton: "assets/images/pants.png",
                        text: "Men Pants",
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 270,
          width: 400,
          // color: Colors.blue,
          // color: Colored,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Flash Sale',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 205),
                  RichText(
                    text: TextSpan(
                        text: 'See More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => flashscreen(),
                                    ))
                              }),
                  ),
                ],
              ),
              Container(
                  height: 240,
                  width: 400,
                  // color: Colors.green,
                  // width: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: readflashproduct.flashproducts.length,
                      // shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(0, 0, 6, 12),
                      itemBuilder: (context, index) {
                        return listmaker(
                          productModels: watchflashproduct.flashproducts[index],
                          // setFav: () => readproduct.setFavorite(
                          //     watchflashproduct.flashproducts[index]),
                        );
                      }

                      // product.flashproducts
                      ))
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        // ignore: sized_box_for_whitespace
        Container(
            height: 270,
            width: 400,
            // color: Colors.red,
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mega Sale',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 205),
                      RichText(
                        text: TextSpan(
                            text: 'See More',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => megascreen(),
                                        ))
                                  }),
                      ),
                    ],
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                      height: 240,
                      width: 400,
                      // color: Colors.green,
                      // width: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: readmegaproduct.megaproducts.length,
                          // shrinkWrap: true,
                          padding: const EdgeInsets.fromLTRB(0, 0, 6, 12),
                          itemBuilder: (context, index) {
                            return listmaker(
                              productModels:
                                  watchmegaproduct.megaproducts[index],
                              // setFav: () => readproduct.setFavorite(
                              //     watchmegaproduct.megaproducts[index]),
                            );
                          }))
                ])),

        SizedBox(height: 30),
        Container(
            // color: Colors.blue,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 600,
            width: 410,
            // color: Colors.red,
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    // height: 250,
                    width: 410,
                    // color: Colors.blue,

                    child: Image.asset(
                      'assets/images/recom.png',
                      fit: BoxFit.fill,
                      // height: 190,
                      // width: 400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 70),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recommended Products ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "We recommend the best for you ",
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                  ),
                ]),
                Container(
                  height: 365,
                  width: 410,

                  // color: Colors.blue,
                  child: recommend(),
                )
              ],
            )),

        // SizedBox(height: 30)
      ]),
      // SizedBox(height: 5),
    )));
  }
}
