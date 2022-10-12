import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/controller/megalist_provider.dart';

import 'package:lafyuu/view/widgets/listmaker.dart';

import '../../controller/riverpod_management.dart';
import '../widgets/app_bar.dart';
import '../widgets/listmaker.dart';

class megascreen extends ConsumerWidget {
  const megascreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watchmegaproduct = ref.watch(megaproductsRiverpod);
    var readmegaproduct = ref.read(megaproductsRiverpod);

    var watchmegafav = ref.watch(productRiverpod);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: autoappbar(
            text: 'Mega Sale',
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                // color: Colors.red,
                height: 1000,
                padding: const EdgeInsets.only(bottom: 240),
                child: GridView.builder(
                    itemCount: readmegaproduct.megaproducts.length,
                    // shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(6, 0, 6, 52),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return listmaker(
                        productModels: watchmegaproduct.megaproducts[index],
                        // setFav: () => watchmegafav
                        //     .setFavorite(watchmegaproduct.megaproducts[index]),
                      );
                    }))));
  }
}
