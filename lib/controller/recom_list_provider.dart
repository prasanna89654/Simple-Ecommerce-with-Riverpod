import 'package:flutter/material.dart';
import 'package:lafyuu/controller/products_provider.dart';

import '../model/product_model.dart';

class recomlistprovider extends ChangeNotifier {
  List<ProductModel> recomproducts = [
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
      flashButton: 'assets/images/hbag.png',
      text: 'Quilted Maxi cross Bag',
      text1: "9000",
      price: 4000,
      text3: '34% off',
      desc: 'we',
      isFav: false,
    ),
    ProductModel(
        flashButton: 'assets/images/stylish.png',
        text: 'Goldstar A100',
        text1: "19000",
        price: 14000,
        text3: '23% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
    ProductModel(
        flashButton: 'assets/images/handdbag.png',
        text: 'Bello handbag',
        text1: '12000',
        price: 8000,
        text3: '30% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
    ProductModel(
        flashButton: 'assets/images/watch.png',
        text: 'Nike series 5',
        text1: '4000',
        price: 3000,
        text3: '12% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
    ProductModel(
        flashButton: 'assets/images/habag.png',
        text: 'Gucci Selma Bag',
        text1: '15000',
        price: 12000,
        text3: '20% off',
        // touched: () {},
        desc: 'we',
        isFav: false),
  ];
}
