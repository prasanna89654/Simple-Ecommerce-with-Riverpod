import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/controller/products_provider.dart';
import 'package:lafyuu/model/product_model.dart';

import '../../controller/riverpod_management.dart';
import '../widgets/cart_screen_maker.dart';
import '../widgets/favoritemaker.dart';

class CartScreen extends ConsumerWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(productRiverpod);
    List<ProductModel> allitems = cart.keyList;
    List<int> allitemsCount = cart.valueList as List<int>;
    // var count = ref.watch(counterRiverpod);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: 1000,
            width: double.infinity,
            child: cart.cartproducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No Products in cart'),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        height: 550,
                        width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: allitems.length,
                            itemBuilder: (context, index) {
                              var item = allitems[index];
                              return cartmaker(
                                name: item.text,
                                price: item.price,
                                photo: item.flashButton,
                                isFav: item.isFav,
                                itemcount: allitemsCount[index],
                                onDecrement: () {
                                  if (allitemsCount[index] != 1) {
                                    ref
                                        .read(productRiverpod)
                                        .deleteProduct(item);
                                  } else {
                                    return null;
                                  }
                                },
                                onIncrement: () {
                                  ref.read(productRiverpod).addcart(item);
                                },
                                onRemoved: () {
                                  ref
                                      .watch(productRiverpod)
                                      .removeProduct(item);
                                },
                              );
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 100,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // SizedBox(width: 180),
                                  Text(
                                    "\$ ${ref.watch(productRiverpod).totalPrice}",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  showDialog(
                                      barrierDismissible: false,
                                      builder: (BuildContext context) => Dialog(
                                              child: Container(
                                            alignment: FractionalOffset.center,
                                            height: 80.0,
                                            padding: EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                CircularProgressIndicator(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text("Loading"),
                                                ),
                                              ],
                                            ),
                                          )),
                                      context: context);

                                  await Future.delayed(
                                      const Duration(seconds: 2));

                                  await showDialog(
                                      barrierDismissible: false,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              // title: Text("LogOut"),
                                              content: Text(
                                                  "Thank you for purchasing your product wil be delivered soon."),
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
                                                    'Done',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ]),
                                      context: context);

                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Purchase",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
