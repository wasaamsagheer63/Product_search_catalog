import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/Products.dart';

class ProductRepo {
  late final String Mockurl;
  String? mainId;

  ProductRepo({
    this.Mockurl =
        'https://688c665ccd9d22dda5ccfa73.mockapi.io/api/v1/products',
  });

  Future<List<Products>> getProducts() async {
    try {
      final responce = await http.get(Uri.parse(Mockurl));
      List<dynamic> ListProducts = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        print("Data Loaded Successfully");
       final products = <Products>[];
       for (var item in ListProducts){
          mainId = item['id'].toString();
         for(var key in item.keys){
           if(key != 'id' && key != 'createdAt'  && key != 'name' && key != 'avatar'){
             products.add(Products.fromMap(mainId!, item[key]));
           }
         }
       }
       return products;
      } else {
        throw Exception("Data is not Loaded ${responce.statusCode}");
      }
    } catch (e) {
      throw Exception("Data is not Loaded due to ${e.toString()}");
    }
  }
  
  Future<void> delete(String id)async{
    try {
      final data = await http.delete(Uri.parse('$Mockurl/$id'));
      if(data.statusCode == 200 && data.statusCode == 204){
        print("Deleted");
      }
      else{
        Get.snackbar("Error", "Problem in deltetion${data.statusCode}");
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}
