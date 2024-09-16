import 'dart:convert';
import 'package:http/http.dart' as http;
import 'modal/product_modal.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['products'];
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to fetch products with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Network Error: Failed to fetch products');
    }
  }
}
