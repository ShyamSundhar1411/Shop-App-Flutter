import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = Dummy_Data;
  var showFavoritesOnly = false;
  List<Product> get getProducts {
    if (showFavoritesOnly) {
      return _items.where((element) => element.isFavorite == true).toList();
    } else {
      return [..._items];
    }
  }

  List<Product> get favoriteItems {
    return _items
        .where(
          (element) => element.isFavorite == true,
        )
        .toList();
  }

  void addProduct(value) {
    //_items.add(value);
    notifyListeners();
  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
