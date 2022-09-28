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

  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
    } else {
      print('...');
    }
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
