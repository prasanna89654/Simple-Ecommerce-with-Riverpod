import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/model/product_model.dart';

import '../../controller/riverpod_management.dart';
import '../widgets/custom_list.dart';
import '../widgets/textbox.dart';
import 'login.dart';

class search extends ConsumerWidget {
  search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isfound = false;
    var enteredvalue;

    var mega = ref.watch(megaproductsRiverpod);

    var flash = ref.watch(flashproductsRiverpod);
    var recom = ref.watch(recomproductsRiverpod);

    var top = ref.watch(topsearchRiverpod);

    List catchmega = [];
    List catchflash = [];
    List catchrecom = [];

    // void searchproducts(String data) {
    for (int i = 0; i < recom.recomproducts.length; i++) {
      catchmega.add(mega.megaproducts[i].text);
      catchflash.add(flash.flashproducts[i].text);
      catchrecom.add(recom.recomproducts[i].text);
    }

    int? searchproduct(String data) {
      for (int index = 0; index < recom.recomproducts.length; index++) {
        if (data == catchmega[index]) {
          return catchmega[index];
        }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 280,
                      // color: Colors.red,
                      child: TextFormField(
                        onChanged: (value) {
                          enteredvalue = value;
                        },
                        textAlign: TextAlign.start,
                        decoration: textDecoration.copyWith(
                          labelText: "Search any products",
                          prefixIcon: const Icon(Icons.search),
                        ),
                      )),
                  Container(
                      height: 50,
                      width: 80,
                      // color: Colors.green,
                      child: ElevatedButton(
                          onPressed: (() {
                            var name = searchproduct(enteredvalue);
                            BackdropFilter alert = BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                child: AlertDialog(
                                    title: Text("${name}"),
                                    content: Text("Are you sure to logout?"),
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
                                          'cancel',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            // backgroundColor: Colors.blue,
                                            ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen(),
                                              ));
                                        },
                                        child: Text(
                                          'ok',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ]));
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }),
                          child:
                              Text("Search", style: TextStyle(fontSize: 14))))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 35,
                  // color: Colors.green,
                  width: double.infinity,
                  child: const Text(
                    'Top Searches',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 460,
                  // color: Colors.red,
                  // width: 200,
                  // padding: const ed,
                  // color: Colors.red,
                  child: isfound
                      ? Center(
                          child: Text("Found"),
                        )
                      : Center(
                          child: Text("Not found"),
                        )
                  // : ListView.builder(
                  //     itemCount: top.topsearch.length,
                  //     // dragStartBehavior: ,
                  //     // shrinkWrap: true,
                  //     // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     //     crossAxisCount: 1),
                  //     itemBuilder: (context, index) {
                  //       return top.topsearch[index];
                  //       // return ListTile(
                  //       //   leading: Icon(Icons.search),
                  //       // );

                  //       // return topsearch[index];
                  //     }),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
