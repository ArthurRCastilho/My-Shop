import 'package:flutter/material.dart';
import 'package:myshop/data/dummy_data.dart';
import 'package:myshop/models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;
  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
