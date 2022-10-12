// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_model.dart';

// final cartProvider = ChangeNotifierProvider<Productprovider>((ref) {
//   return Productprovider();
// });

class Productprovider extends ChangeNotifier {
  List<ProductModel> favorites = [];

  Map<ProductModel, int> cartproducts = {};
  Productprovider();

  List<ProductModel> get keyList => cartproducts.keys.toList();

  double get totalPrice {
    double price = 0.0;
    cartproducts.forEach((key, val) => price += (key.price * val));
    return price;
  }

  int get cartItemCount {
    int qty = 1;
    cartproducts.forEach((key, value) => qty += value);
    return qty;
  }

  // void decrementcounter() {
  //   if (countervalue > 1) {
  //     countervalue--;
  //   } else
  //     countervalue = countervalue;
  //   notifyListeners();
  // }

  void get valueList => cartproducts.values.toList();

  void setFavorite(ProductModel model) {
    if (model.isFav) {
      model.isFav = false;
      favorites.remove(model);
      notifyListeners();
    } else {
      model.isFav = true;
      favorites.add(model);
      notifyListeners();
    }
  }

  // void addTotalPrice(ProductModel model) {
  //   totalPrice += (model.price * countervalue);
  // }

  // void deleteTotalPrice(ProductModel model) {
  //   totalPrice -= (model.price * countervalue);
  // }

  void addcart(ProductModel model) {
    cartproducts.update(
      model,
      (int) => cartproducts[model] = (cartproducts[model]! + 1),
      ifAbsent: () => cartproducts[model] = 1,
    );

    notifyListeners();
  }

  int getProduct(int text) {
    if (cartproducts.entries.any((element) => element.key.text == text)) {
      return cartproducts.entries
          .firstWhere((element) => element.key.text == text)
          .value
          .toInt();
    } else {
      return 0;
    }
  }

  void deleteProduct(ProductModel product) {
    if (cartproducts.containsKey(product) && cartproducts[product]! > 0) {
      cartproducts.update(product, (int) => cartproducts[product]! - 1);
      if (cartproducts.entries
              .firstWhere((element) => element.key.text == product.text)
              .value ==
          0) {
        cartproducts.remove(product);
      }
    }
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    cartproducts.remove(product);
    //cartItemCount--;
    notifyListeners();
  }
}
