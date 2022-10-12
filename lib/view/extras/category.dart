import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/custom_list.dart';

class category extends StatefulWidget {
  category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<CustomList> category = [
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
      textButton: "assets/images/dress.png",
      text: "Night Dress",
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: autoappbar(
            text: 'Category',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 600,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 30),
            // padding: const EdgeInsets.symmetric(vertical: 30),
            // color: Colors.red,
            child: GridView.builder(
              itemCount: category.length,
              // dragStartBehavior: ,
              // shrinkWrap: true,
              // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return category[index];
                // return ListTile(
                //   leading: Icon(Icons.search),
                // );

                // return topsearch[index];
              },
            ),
          ),
        ));
  }
}
