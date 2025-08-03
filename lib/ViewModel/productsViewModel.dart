import 'package:angolia_search_project/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Repository/ProductsRepo.dart';

class ProductViewModel extends GetxController{
  ProductRepo productsRepo = Get.find();
RxList<Products> products = <Products>[].obs;
RxBool loading = false.obs;
RxString errorMessage = "".obs;


@override
  void onInit(){
   super.onInit();
   loadData();
}

Future<void> loadData() async{
  loading.value = true;

  try{
    errorMessage.value = "";
products.assignAll(await productsRepo.getProducts());
  }
      catch (e){
Get.snackbar("Error", "${e}");
errorMessage.value = e.toString();
      }
   finally {
    loading.value = false;
   }

}
Future<void> delete(String id)async{
  await productsRepo.delete(id);
  Get.snackbar("Title", "Data deleted",);
}
}