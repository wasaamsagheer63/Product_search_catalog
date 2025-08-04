import 'package:angolia_search_project/ViewModel/productsViewModel.dart';
import 'package:get/get.dart';

import '../../Repository/ProductsRepo.dart';


class AddProductBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(ProductRepo());
    Get.put(ProductViewModel());

  }
}