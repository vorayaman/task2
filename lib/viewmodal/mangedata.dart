import 'package:flutter/material.dart';
import '../apimanager.dart';
import '../modal/product_modal.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  Set<String> _selectedBrands = {};

  bool _isLoading = false;
  String _errorMessage = '';
  List<Product> get products =>
      _filteredProducts.isEmpty ? _allProducts : _filteredProducts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Set<String> get selectedBrands => _selectedBrands;

  ProductService _productService = ProductService();

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _allProducts = await _productService.fetchProducts();
      _filteredProducts = _allProducts;
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch products';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<String> getAvailableBrands() {
    return _allProducts
        .map((product) => product.brand)
        .where((brand) => brand != null)
        .cast<String>()
        .toSet()
        .toList();
  }

  void setProducts(List<Product> products) {
    _allProducts = products;
    notifyListeners();
  }

  void filterByBrands(Set<String> selectedBrands) {
    _selectedBrands = selectedBrands;
    if (_selectedBrands.isEmpty) {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts
          .where((product) => _selectedBrands.contains(product.brand))
          .toList();
    }
    notifyListeners();
  }

  void clearFilters() {
    _selectedBrands.clear();
    _filteredProducts = _allProducts;
    notifyListeners();
  }
}
