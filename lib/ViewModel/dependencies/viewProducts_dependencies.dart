import 'package:angolia_search_project/ViewModel/productsViewModel.dart';
import 'package:get/get.dart';

import '../../Repository/ProductsRepo.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(ProductRepo());
    Get.put(ProductViewModel());

  }
}