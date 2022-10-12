import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/model/product_model.dart';

import '../../controller/riverpod_management.dart';
import '../screens/details.dart';

class cartmaker extends ConsumerWidget {
  cartmaker({
    Key? key,
    required this.itemcount,
    required this.isFav,
    required this.name,
    required this.price,
    required this.photo,
    required this.onDecrement,
    required this.onIncrement,
    required this.onRemoved,
  }) : super(key: key);

  final int itemcount;
  final String name;
  final double price;
  final String photo;
  final bool isFav;
  final void Function()? onDecrement;
  final void Function()? onIncrement;
  final void Function()? onRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // num result = itemcount * price;
    // final products = ref.watch(productRiverpod);
    // var counter = ref.watch(counterRiverpod);
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 140,
              // width: 178,
              // color: Colors.red,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: const Color(0xFFDBE9F4)),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(children: [
                      Container(
                          height: 180,

                          // width: 180,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(width: 6, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // color: Colors.red,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => DetailsPage(
                              //         productDetails: productModels,
                              //         // setFavv: () {},
                              //       ),
                              //     ));
                            },
                            child: Image.asset(
                              photo,
                              fit: BoxFit.fill,
                              // height: 132,
                              // width: 160,
                            ),
                          )),
                      SizedBox(
                        height: 30,
                        width: 130,
                      ),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            // crossAxisAlignment: CrossAxisAlignment.,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "\$ $name",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                      // fontSize: h * 0.015,
                                      ),
                                ),
                              ),
                              SizedBox(width: 60),
                              Text(
                                "${itemcount * price}",
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                ),
                              ),
                            ]),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // padding: const EdgeInsets.only(left: 80),
                              height: 40,
                              width: 180,
                              // color: Colors.red,

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: onIncrement,
                                      child: Icon(Icons.add),
                                      style: TextButton.styleFrom(
                                          primary: Colors.blue,
                                          side: BorderSide(
                                            width: 2,
                                            color: Colors.blue,
                                          ))),
                                  Text(
                                    "${itemcount}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  TextButton(
                                      onPressed: onDecrement,
                                      child: Icon(Icons.remove),
                                      style: TextButton.styleFrom(
                                          primary: Colors.blue,
                                          side: BorderSide(
                                            width: 2,
                                            color: Colors.blue,
                                          ))),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            IconButton(
                                icon: Icon(Icons.delete), onPressed: onRemoved)
                          ],
                        ),
                      ],
                    ),
                    //   ],
                    // )),
                    //productModels.textButton,

                    // height: 40,
                    // width: 40,
                    // color: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
