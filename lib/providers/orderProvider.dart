import 'dart:convert';
import 'package:flutter/foundation.dart';
import './cartProvider.dart';
import 'package:http/http.dart' as http;

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

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.https(
        'flutter-shop-app-1bfc9-default-rtdb.firebaseio.com', '/orders.json');
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts.map((element)=>{
              'id':element.id,
              'title':element.title,
              'quantity':element.quantity,
              'price':element.price,
            }).toList(),
          }));
      final responseContent = json.decode(response.body);
      final OrderItem order = OrderItem(
          responseContent['name'].toString(), total, cartProducts, DateTime.now());
      _orders.insert(0, order);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
