import '../models/products_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductsRepo {
  static const jeweleryUrl =
      'https://fakestoreapi.com/products/category/jewelery';
  static const electronicsUrl =
      'https://fakestoreapi.com/products/category/electronics';

  Future<List<ProductsModel>> getJeweleries() async {
    Response response = await http.get(Uri.parse(jeweleryUrl));
    return productsModelFromJson(response.body);
  }

  Future<List<ProductsModel>> getElectronics() async {
    Response response = await http.get(Uri.parse(electronicsUrl));
    return productsModelFromJson(response.body);
  }
}
