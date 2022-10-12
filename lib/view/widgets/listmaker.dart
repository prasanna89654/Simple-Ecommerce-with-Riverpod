// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, camel_case_types

import 'package:flutter/material.dart';
import 'package:lafyuu/controller/riverpod_management.dart';

import '../../model/product_model.dart';
import '../screens/details.dart';

class listmaker extends StatelessWidget {
  ProductModel productModels;
  // Function setFav;

  listmaker({
    Key? key,
    required this.productModels,
    // required this.setFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Container(
        height: 270,
        width: 178,
        // color: Colors.red,
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: const Color(0xFFDBE9F4)),
            borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    height: 132,
                    width: 190,
                    decoration: BoxDecoration(
                      border: Border.all(width: 6, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // color: Colors.red,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                productDetails: productModels,
                                // setFavv: () => setFav()
                              ),
                            ));
                      },
                      child: Image.asset(
                        productModels.flashButton,
                        fit: BoxFit.fill,
                        // height: 132,
                        // width: 160,
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        productModels.text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontSize: h * 0.015,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Container(
                    //     height: 50,
                    //     width: 70,
                    //     color: Colors.blue,
                    //     child: Column(
                    // children: [
                    Text(
                      "\$ ${productModels.text1}",
                      //productModels.text1,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Text(
                        "\$ ${productModels.price}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        productModels.text3,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    //   ],
                    // )),
                    //productModels.textButton,

                    // height: 40,
                    // width: 40,
                    // color: Colors.blue,
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
