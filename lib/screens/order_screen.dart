import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orderProvider.dart';
import '../widgets/orderDisplayWidget.dart';
class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderContainer = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body:ListView.builder(
        itemCount: orderContainer.orders.length,
        itemBuilder: (context, index) =>  OrderItemWidget(orderContainer.orders[index]),
        )
    );
  }
}
