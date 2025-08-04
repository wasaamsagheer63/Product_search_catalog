import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/Products.dart';

class ProductRepo {
  late final String data;

  ProductRepo({
    this.data = 'https://688c665ccd9d22dda5ccfa73.mockapi.io/api/v1/data',
  });

  Future<List<Products>> getnewData()async{
    try {
      final responce = await http.get(Uri.parse(data));
      var Productdata = jsonDecode(responce.body.toString());
      final dataList = <Products>[];

      if (responce.statusCode == 200) {
        for (var d in Productdata) {
          dataList.add(Products.fromMap(d['id'].toString(), d));
        }
        return dataList;
      }
      else {
        throw Exception("Data is not loaded from other api");
      }
    }
    catch(e){
      throw Exception("");
    }
  }
  
  Future<void> delete(String id)async{
    try {
      final datadelete = await http.delete(Uri.parse('$data/$id'));
      if(datadelete.statusCode == 200 || datadelete.statusCode == 204){
        Get.snackbar("Success","Product is deleted successfully");
      }
      else{
        Get.snackbar("Error", "Problem in deltetion${datadelete.statusCode}");
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  Future<void> sendData(Products product)async{

    try{
      final newData = await http.post(Uri.parse(data),
          headers: {'Content-Type':'application/json'},
          body: jsonEncode(product.toMap()));
      if (newData.statusCode == 201) {
        Get.snackbar("Success", "Product is uploaded");
      }
      else{
        print("Product is not Stored ${newData.statusCode}");
      }
    }
        catch(e){
      throw Exception(e.toString());
        }
  }

  Future<void> updateData(Products product)async{

    try{
      final newData = await http.put(Uri.parse('$data/${product.id}'),
          headers: {'Content-Type':'application/json'},
          body: jsonEncode(product.toMap()));
      if (newData.statusCode == 200) {
        Get.snackbar("Success", "Product is uploaded");
      }
      else{
        print("Product is not Stored ${newData.statusCode}");
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}
