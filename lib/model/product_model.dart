import 'dart:ffi';

class ProductModel {
  bool isFav;
  String flashButton;
  String text;
  String text1;
  double price;
  String text3;
  // VoidCallback touched;
  String? desc;

  ProductModel({
    required this.isFav,
    required this.flashButton,
    required this.text,
    required this.text1,
    required this.price,
    required this.text3,
    this.desc,
    // required this.touched,
  });
}
