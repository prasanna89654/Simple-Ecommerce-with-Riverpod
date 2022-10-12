import 'package:flutter/material.dart';

// import '../model/product_model.dart';
import '../view/widgets/custom_list.dart';

class tpsearch extends ChangeNotifier {
  List<CustomList> topsearch = [
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
  ];
}
