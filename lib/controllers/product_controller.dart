import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  void fetchProducts() async {
    var _products = await RemoteService.fetchProducts();

    if (_products != null) {
      productList.value = _products;
    }
  }
}
