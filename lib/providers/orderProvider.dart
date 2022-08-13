import 'package:flutter/foundation.dart';
import './cartProvider.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem(this.id, this.amount, this.products, this.dateTime);
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    final OrderItem order = OrderItem(
        DateTime.now().toString(), total, cartProducts, DateTime.now());
    _orders.insert(0, order);
    notifyListeners();
  }
}
