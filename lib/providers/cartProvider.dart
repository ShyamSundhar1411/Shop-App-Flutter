import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final quantity;
  final double price;
  double total = 0.0;
  CartItem(this.id, this.title, this.price, this.quantity);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    if (_items == null) {
      return 0;
    } else {
      return _items.length;
    }
  }

  void addItem(String id, double price, String title) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (value) =>
              CartItem(value.id, value.title, value.price, value.quantity + 1));
    } else {
      _items.putIfAbsent(
          id, () => CartItem(DateTime.now().toString(), title, price, 1));
    }
  }
  notifyListeners();
}
