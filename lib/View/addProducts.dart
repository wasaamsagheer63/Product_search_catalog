import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ViewModel/productsViewModel.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  TextEditingController indexController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController eanController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController internalIDController = TextEditingController();
  late final ProductViewModel productsViewModel ;
  @override
  void initState(){
    super.initState();
    productsViewModel = Get.find();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
                  TextButton(onPressed: () { productsViewModel.sendData(
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
                    setState(() {

                    });}, child: Text("Save Data")),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
