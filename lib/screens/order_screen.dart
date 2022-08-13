import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/orderProvider.dart';
import '../widgets/orderDisplayWidget.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderContainer = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemCount: orderContainer.orders.length,
          itemBuilder: (context, index) =>
              OrderItemWidget(orderContainer.orders[index]),
        ));
  }
}
