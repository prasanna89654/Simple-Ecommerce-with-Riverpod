import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lafyuu/controller/products_provider.dart';

import '../../controller/riverpod_management.dart';
import '../widgets/favoritemaker.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var product = ref.watch((productRiverpod));
    return Scaffold(
        body: product.favorites.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Favorites'),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: product.favorites.length,
                itemBuilder: (context, index) {
                  return favoritemaker(
                    productModels: product.favorites[index],
                  );
                }));
  }
}
