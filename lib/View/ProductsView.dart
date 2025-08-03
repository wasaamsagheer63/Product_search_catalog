import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ViewModel/productsViewModel.dart';
import '../model/Products.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late final ProductViewModel productsViewModel ;
  @override
  void initState(){
    super.initState();
    productsViewModel = Get.find();
  }
  void showData(Products product){
     showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             title: Text(product.Name),
             content: SingleChildScrollView(
               child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Id: ${product.Index}"),
                   Text("Name:${product.Name}"),
                   Text("Price: ${product.Price}"),
                   SizedBox(height: 6,),
                   Text("Description: ${product.Description}"),
                   Text("Brand: ${product.Brand}"),
                   Text("Category: ${product.Category}"),
                   Text("Currency: ${product.Currency}"),
                   Text("Color: ${product.Color}"),
                   Text("Size: ${product.Size}"),
                   SizedBox(height: 20,),
                   Row(
                       spacing: 50,
                       children: [
                         TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Back")),
                         TextButton(onPressed: () {
                           Navigator.of(context).pop();
                           productsViewModel.delete(product.id);}, child: Text("Delete",style:TextStyle(color: Colors.red),)),
                       ],
                     )

                 ],
               ),
             ),
           );

     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx((){
              if(productsViewModel.loading.value) return CircularProgressIndicator();
              else{
             return Expanded(
               child: ListView.builder(
                 padding:EdgeInsets.all(8),
                   itemCount :productsViewModel.products.length,
                   itemBuilder: (context,index){
                  Products product = productsViewModel.products[index];

                  return Card(
                    child: InkWell(
                      onTap:()=>showData(product),

                      child: Container(
                        child: Column(
                          children: [
                            Text("Id: ${product.Index}"),
                            Text("Name:${product.Name}"),
                            Text("Price: ${product.Price}"),
                            SizedBox(height: 6,),
                            Text("Description: ${product.Description}"),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
             );
            }}),
          ],
        ),),
      ),
    );
  }
}
