import 'package:angolia_search_project/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Repository/ProductsRepo.dart';

class ProductViewModel extends GetxController {
  ProductRepo productsRepo = Get.find();
  RxList<Products> products = <Products>[].obs;
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;


  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    loading.value = true;

    try {
      products.assignAll(await productsRepo.getnewData());
    }
    catch (e) {
      Get.snackbar("Error", "${e}");
      errorMessage.value = e.toString();
    }
    finally {
      loading.value = false;
    }
  }

  Future<void> delete(String id) async {
    loading.value = true;
    try {
      await productsRepo.delete(id);
      products.removeWhere((product) => product.id == id);
      Get.snackbar("Title", "Data deleted",);
    }
    catch (e) {
      throw Exception(e.toString());
    }
    finally {
      loading.value = false;
    }
  }

  Future<void> refreshData() async {
    await loadData();
  }

  Future<void> sendData(String index, String name, String description,
      String brand, String category, String price, String currency, String stoke,
      String ean, String color, String size, String availability,
      String internalID) async {
    
    bool isValid = true;
    List<String> errorList = [];
    
    
    
    
    if(index.isEmpty){
      errorList.add("Fill the Index");
      isValid = false;
    }
    

    if(name.isEmpty){
      errorList.add("Fill this with updated  Name");
      isValid = false;
    }

    if(description.isEmpty){
      errorList.add("Fill this with updated  description");
      isValid = false;
    }

    if(brand.isEmpty){
      errorList.add("Fill this with updated  brand");
      isValid = false;
    }

    if(category.isEmpty){
      errorList.add("Fill this with updated  category");
      isValid = false;
    }

    if(price.isEmpty){
      errorList.add("Fill this with updated  Price");
      isValid = false;
    }

    if(currency.isEmpty){
      errorList.add("Fill this with updated  currency");
      isValid = false;
    }

    if(stoke.isEmpty){
      errorList.add("Fill the stoke value");
      isValid = false;
    }

    if(ean.isEmpty){
      errorList.add("Fill the EAN value");
      isValid = false;
    }

    if(color.isEmpty){
      errorList.add("Fill the Color Value");
      isValid = false;
    }

    if(size.isEmpty){
      errorList.add("Fill the Size value");
      isValid = false;
    }

    if(availability.isEmpty){
      errorList.add("Fill Availability value");
      isValid = false;
    }

    if(internalID.isEmpty){
      errorList.add("Fill this with updated  Internal ID");
      isValid = false;
    }
    Products product =Products("", int.parse(index), name, description, brand, category, int.parse(price), currency, int.parse(stoke), int.parse(ean), color, size, availability, int.parse(internalID));
    try {
      if(isValid){
        loading.value = true;
      await productsRepo.sendData(product);
      Get.snackbar("Success", "Product is Stored");
      loadData();
       }
      else{
        return;
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
    finally{
      loading.value = false;
    }
  }







  Future<void> updateData(String id,String index, String name, String description,
      String brand, String category, String price, String currency, String stoke,
      String ean, String color, String size, String availability,
      String internalID) async {

    bool isValid = true;
    List<String> errorList = [];




    if(index.isEmpty){
      errorList.add("Fill the Updated Index");
      isValid = false;
    }


    if(name.isEmpty){
      errorList.add("Fill this with updated  Name");
      isValid = false;
    }

    if(description.isEmpty){
      errorList.add("Fill this with updated  description");
      isValid = false;
    }

    if(brand.isEmpty){
      errorList.add("Fill this with updated  brand");
      isValid = false;
    }

    if(category.isEmpty){
      errorList.add("Fill this with updated  category");
      isValid = false;
    }

    if(price.isEmpty){
      errorList.add("Fill this with updated  Price");
      isValid = false;
    }

    if(currency.isEmpty){
      errorList.add("Fill this with updated  currency");
      isValid = false;
    }

    if(stoke.isEmpty){
      errorList.add("Fill the stoke value");
      isValid = false;
    }

    if(ean.isEmpty){
      errorList.add("Fill the EAN value");
      isValid = false;
    }

    if(color.isEmpty){
      errorList.add("Fill the Color Value");
      isValid = false;
    }

    if(size.isEmpty){
      errorList.add("Fill the Size value");
      isValid = false;
    }

    if(availability.isEmpty){
      errorList.add("Fill Availability value");
      isValid = false;
    }

    if(internalID.isEmpty){
      errorList.add("Fill this with updated  Internal ID");
      isValid = false;
    }
    Products product =Products(id, int.parse(index), name, description, brand, category, int.parse(price), currency, int.parse(stoke), int.parse(ean), color, size, availability, int.parse(internalID));
    try {
      if(isValid){
        loading.value = true;
        await productsRepo.updateData(product);
        Get.snackbar("Success", "Product is Updated");
        loadData();
      }
      else{
        return;
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
    finally{
      loading.value = false;
    }
  }

}