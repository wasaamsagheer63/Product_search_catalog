import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/Products.dart';

class dataTransfer extends StatefulWidget {
  const dataTransfer({super.key});


  @override
  State<dataTransfer> createState() => _dataTransferState();
}

class _dataTransferState extends State<dataTransfer> {


  @override

  Future<void> getProducts() async {
    try {
      final responce = await http.get(Uri.parse('https://688c665ccd9d22dda5ccfa73.mockapi.io/api/v1/products'));
      List<dynamic> ListProducts = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        print("Data Loaded Successfully");
        final products = <Products>[];
        for (var item in ListProducts){
          String mainId = item['id'].toString();
          for(var key in item.keys){
            if(key != 'id' && key != 'createdAt'  && key != 'name' && key != 'avatar'){
              var productData = item[key];
              if(productData is Map<String,dynamic>){
                products.add(Products.fromMap(mainId +'_'+key, productData));
              }
            }
          }
        }
        for(var datas in products) {
          final newData = await http.post(Uri.parse('https://688c665ccd9d22dda5ccfa73.mockapi.io/api/v1/data'),
              headers: {'Content-Type':'application/json'},
              body: jsonEncode(datas.toMap()));
          if (newData.statusCode != 201) {
            print(newData.statusCode);
          }
          else{
            print("Data is not loaded${newData.statusCode}");
          }
        }
      }
    } catch (e) {
      throw Exception("Data is not Loaded due to ${e.toString()}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () => getProducts(), child: Text("Data Transfer")),
      ),
    );
  }
}
