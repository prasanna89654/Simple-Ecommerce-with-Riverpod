import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lafyuu/controller/counter_provider.dart';
import 'package:lafyuu/controller/flashlist_provider.dart';
import 'package:lafyuu/controller/megalist_provider.dart';
import 'package:lafyuu/controller/products_provider.dart';
import 'package:lafyuu/controller/recom_list_provider.dart';
import 'package:lafyuu/controller/topsearch_provider.dart';

final flashproductsRiverpod =
    ChangeNotifierProvider<flistprovider>((ref) => flistprovider());

final megaproductsRiverpod =
    ChangeNotifierProvider<mlistprovider>((ref) => mlistprovider());

final recomproductsRiverpod =
    ChangeNotifierProvider((ref) => recomlistprovider());
final productRiverpod =
    ChangeNotifierProvider<Productprovider>((ref) => Productprovider());

final topsearchRiverpod = ChangeNotifierProvider((ref) => tpsearch());
