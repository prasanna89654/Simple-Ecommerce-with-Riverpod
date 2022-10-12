import 'package:flutter/material.dart';

import '../model/product_model.dart';

class flistprovider extends ChangeNotifier {
  List<ProductModel> flashproducts = [
    ProductModel(
        flashButton: 'assets/images/red.png',
        text: 'Jordan air 5',
        text1: '3000',
        price: 2100,
        text3: '18% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
    ProductModel(
        flashButton: 'assets/images/nike.png',
        text: 'Nike pro N65',
        text1: '9000',
        price: 7800,
        text3: '23% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
    ProductModel(
      flashButton: 'assets/images/yellow.png',
      text: 'Nike Air Max 270',
      text1: '5000',
      price: 2000,
      text3: '30% off',
      desc: 'we',
      // touched: () {},
      isFav: false,
    ),
    ProductModel(
      flashButton: 'assets/images/hbag.png',
      text: 'Quilted Maxi cross Bag',
      text1: "9000",
      price: 4000,
      text3: '34% off',
      desc: 'we',
      isFav: false,
    ),
    ProductModel(
        flashButton: 'assets/images/red.png',
        text: 'Jordan air 5',
        text1: '3000',
        price: 2100,
        text3: '18% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
    ProductModel(
        flashButton: 'assets/images/nike.png',
        text: 'Nike pro N65',
        text1: '9000',
        price: 7800,
        text3: '23% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
  ];
}
