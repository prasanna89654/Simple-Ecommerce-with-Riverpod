import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/riverpod_management.dart';
import 'listmaker.dart';

class rrecom extends ConsumerWidget {
  rrecom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = 0;
    var watchrecomproduct = ref.watch(recomproductsRiverpod);
    var readrecomproduct = ref.read(recomproductsRiverpod);
    var readproduct = ref.read(productRiverpod);

    return Container(
        height: 290,
        // color: Colors.green,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: readrecomproduct.recomproducts.length,
            // shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 52),
            itemBuilder: (context, index) {
              Random number = new Random();
              final index = number.nextInt(5);
              return listmaker(
                productModels: watchrecomproduct.recomproducts[index],
                // setFav: () => readproduct
                //     .setFavorite(watchrecomproduct.recomproducts[index]),
              );
            }));
  }
}
