import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = Dummy_Data;

  List<Product> get getProducts {
    return [..._items];
  }

  void addProduct(value) {
    //_items.add(value);
    notifyListeners();
  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
