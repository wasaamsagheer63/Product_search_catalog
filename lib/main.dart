import 'package:angolia_search_project/View/ProductsView.dart';
import 'package:angolia_search_project/View/addProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/algolia_search.dart';
import 'ViewModel/dependencies/add_product_dependencies.dart';
import 'ViewModel/dependencies/viewProducts_dependencies.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
getPages: [
  GetPage(name: "/ProductsView", page:() =>ProductsView(),binding: ProductBindings()),
  GetPage(name: "/addProduct", page:() =>AddProducts(),binding: AddProductBindings()),
  GetPage(name: "/search", page: () => SearchAlgolia()),

],
      initialRoute: "/ProductsView",
    );
  }
}
