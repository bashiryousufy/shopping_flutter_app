import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var _products = await RemoteService.fetchProducts();

      if (_products != null) {
        productList.value = _products;
      }
    } on Exception catch (e) {
      print("Not able to fetch Data");
    } finally {
      isLoading(false);
    }
  }
}
