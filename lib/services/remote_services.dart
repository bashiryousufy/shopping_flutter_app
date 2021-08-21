import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var url = Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonResult = response.body;
      return productFromJson(jsonResult);
    } else {
      return [];
    }
  }
}
