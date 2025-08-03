import 'package:angolia_search_project/View/ProductsView.dart';
import 'package:angolia_search_project/ViewModel/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
getPages: [
  GetPage(name: "/ProductsView", page:() =>ProductsView(),binding: ProductBindings()),
],
      initialRoute: "/ProductsView",
    );
  }
}
