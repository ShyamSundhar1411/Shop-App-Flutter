import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];
  var showFavoritesOnly = false;
  List<Product> get getProducts {
    if (showFavoritesOnly) {
      return _items.where((element) => element.isFavorite == true).toList();
    } else {
      return [..._items];
    }
  }

  Future<void> fetchProducts() async {
    final url = Uri.https(
        'flutter-shop-app-1bfc9-default-rtdb.firebaseio.com', '/products.json');
    try {
      final response = await http.get(url);
      final List<Product> _loadedProducts = [];
      final data = json.decode(response.body) as Map<String, dynamic>;
      data.forEach((id, data) {
        _loadedProducts.add(Product(
            id: id,
            title: data['title'],
            description: data['description'],
            imageUrl: data['imageUrl'],
            price: data['price'],
            isFavorite: data['isFavorite']));
      });
      _items = _loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<Product> get favoriteItems {
    return _items
        .where(
          (element) => element.isFavorite == true,
        )
        .toList();
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.https(
        'flutter-shop-app-1bfc9-default-rtdb.firebaseio.com', '/products.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite,
          }));
      final responseContent = json.decode(response.body);
      final newProduct = Product(
          id: responseContent['name'].toString(),
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final url = Uri.https(
          'flutter-shop-app-1bfc9-default-rtdb.firebaseio.com',
          '/products/$id.json');
      http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;
    } else {
      print('...');
    }
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.https('flutter-shop-app-1bfc9-default-rtdb.firebaseio.com',
        '/products/$id.json');
    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException("Could not delete product");
    }
    existingProduct = null;

  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
