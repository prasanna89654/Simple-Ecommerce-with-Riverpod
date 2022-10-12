import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lafyuu/model/flashproduct_model.dart';

import '../../controller/riverpod_management.dart';
import '../screens/login.dart';
import 'listmaker.dart';

class recommend extends ConsumerWidget {
  const recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watchrecomproduct = ref.watch(recomproductsRiverpod);
    var readrecomproduct = ref.read(recomproductsRiverpod);

    var readproduct = ref.watch(productRiverpod);
    return Container(
        height: 360,
        // color: Colors.green,
        child: GridView.builder(
            itemCount: readrecomproduct.recomproducts.length,
            // shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 52),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return listmaker(
                productModels: watchrecomproduct.recomproducts[index],
                // setFav: () => readproduct
                //     .setFavorite(watchrecomproduct.recomproducts[index]),
              );
            }));
  }
}
