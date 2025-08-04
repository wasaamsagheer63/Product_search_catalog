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
                         TextButton(onPressed: () {
                           Navigator.of(context).pop();
                           updateData(product);},
                             child: Text("Update",style:TextStyle(color: Colors.red),)),
                       ],
                     )

                 ],
               ),
             ),
           );

     });
  }

  void updateData(Products product){

    TextEditingController indexController = TextEditingController(text: product.Index.toString());
    TextEditingController nameController = TextEditingController(text:product.Name);
    TextEditingController descriptionController = TextEditingController(text:product.Description);
    TextEditingController brandController = TextEditingController(text:product.Brand);
    TextEditingController categoryController = TextEditingController(text:product.Category);
    TextEditingController priceController = TextEditingController(text:product.Price.toString());
    TextEditingController currencyController = TextEditingController(text:product.Currency);
    TextEditingController stockController = TextEditingController(text:product.Stock.toString());
    TextEditingController eanController = TextEditingController(text:product.EAN.toString());
    TextEditingController colorController = TextEditingController(text:product.Color);
    TextEditingController sizeController = TextEditingController(text:product.Size);
    TextEditingController availabilityController = TextEditingController(text:product.Availability);
    TextEditingController internalIDController = TextEditingController(text:product.internalId.toString());
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Add Product"),
            content: Stack(
              children:[ SingleChildScrollView(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: indexController,

                      decoration: InputDecoration(
                        hintText: "Enter Index ( e.g 1,2,3 )",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: nameController,

                      decoration: InputDecoration(
                        hintText: "Enter Name ",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: descriptionController,

                      decoration: InputDecoration(
                        hintText: "Enter Description",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: brandController,

                      decoration: InputDecoration(
                        hintText: "Enter Brand",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: categoryController,

                      decoration: InputDecoration(
                        hintText: "Enter Category",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: priceController,

                      decoration: InputDecoration(
                        hintText: "Enter Price ",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: currencyController,

                      decoration: InputDecoration(
                        hintText: "Enter Currency",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: stockController,

                      decoration: InputDecoration(
                        hintText: "Enter Stock",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: eanController,

                      decoration: InputDecoration(
                        hintText: "Enter EAN",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: colorController,

                      decoration: InputDecoration(
                        hintText: "Enter Color",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: sizeController,

                      decoration: InputDecoration(
                        hintText: "Enter Size",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: availabilityController,

                      decoration: InputDecoration(
                        hintText: "Enter Availability (e.g 1,2,3):",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 10),

                    TextField(
                      controller: internalIDController,

                      decoration: InputDecoration(
                        hintText: "Enter InternalID",
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        TextButton(onPressed: () => Navigator.of(context).pop(), child:Text("Back")),
                        SizedBox(width: 30,),
                        TextButton(onPressed: () {productsViewModel.updateData(
                          product.id,
                          indexController.text.toString(),
                          nameController.text.toString(),
                          descriptionController.text.toString(),
                          brandController.text.toString(),
                          categoryController.text.toString(),
                          priceController.text.toString(),
                          currencyController.text.toString(),
                          stockController.text.toString(),
                          eanController.text.toString(),
                          colorController.text.toString(),
                          sizeController.text.toString(),
                          availabilityController.text.toString(),
                          internalIDController.text.toString(),
                        );
                          Get.back();
                          setState(() {});
                          }, child: Text("Update Data")),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          );

        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Catalog"),
        actions: [
          IconButton(onPressed: () => productsViewModel.refreshData(), icon: Icon(Icons.refresh_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Get.toNamed("/addProduct"),child: Icon(Icons.add),),


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
