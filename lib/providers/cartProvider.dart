import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final quantity;
  final double price;
  CartItem(this.id, this.title, this.price, this.quantity);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    int count = _items.isEmpty ? 0 : _items.length;
    return count;
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String id, double price, String title) {
    if (_items.containsKey(id)) {
      print("Called Existing");
      _items.update(
          id,
          (cartItem) => CartItem(cartItem.id, cartItem.title, cartItem.price,
              cartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          id, () => CartItem(DateTime.now().toString(), title, price, 1));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
