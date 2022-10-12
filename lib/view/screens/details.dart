import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/controller/riverpod_management.dart';
import 'package:lafyuu/model/product_model.dart';
import 'package:lafyuu/view/widgets/random_recom.dart';
import 'package:lafyuu/view/widgets/style.dart';

import '../widgets/app_bar.dart';
import '../widgets/listmaker.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({
    Key? key,
    required this.productDetails,
    // required this.setFavv,

    // required this.setFav,
  }) : super(key: key);

  ProductModel productDetails;
  // Function setFavv;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var listen = ref.watch(productRiverpod);
    final cart = ref.watch(productRiverpod);

    List<ProductModel> allitem = cart.keyList;
    int allitemsCount = allitem.length;

    // for (int index = 0; index < allitemsCount; index++) {
    //   product.add(allitem[index].text);
    // }

    bool isadded = false;

    for (int i = 0; i < allitemsCount; i++) {
      if (productDetails.text == allitem[i].text) {
        isadded = true;
      } else {
        isadded = false;
      }
    }

    // var item = allitems[];

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: AppBar(
            actions: [
              Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 220,
                      padding: const EdgeInsets.only(top: 12),
                      child: style(
                        text: productDetails.text,
                        fontsize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        height: 50,
                        width: 70,
                        child: IconButton(
                            icon: productDetails.isFav
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              ref
                                  .watch(productRiverpod)
                                  .setFavorite(productDetails);
                            }))
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  // color: Colors.red,
                  child: Image.asset(
                    productDetails.flashButton,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.fromLTRB(13, 15, 3, 0),
                  height: 140,
                  width: double.infinity,
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails.text,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ ${productDetails.text1}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(children: [
                        Text(
                          "\$ ${productDetails.price.toString()}",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        SizedBox(width: 30),
                        Text(
                          productDetails.text3,
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        )
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    height: 120,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          productDetails.desc!,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 20),
                Text("You Might Also Like",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                rrecom()
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 6),
          child: Container(
              height: 60,
              width: 40,
              // padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              // color: Colors.red,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // shape: BoxShape.rectangle,
                color: Colors.blue,
              ),
              child: isadded
                  ? TextButton(
                      child: Text('Remove form Cart',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      onPressed: () {
                        ref
                            .watch(productRiverpod)
                            .removeProduct(productDetails);
                      },
                    )
                  : TextButton(
                      //    productDetails in cartProducts?

                      //  child:

                      child: Text('Add to Cart',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () {
                        ref.watch(productRiverpod).addcart(productDetails);
                      },
                    )),
        ));
  }
}
