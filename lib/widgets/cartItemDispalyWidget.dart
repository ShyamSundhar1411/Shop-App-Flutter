import 'package:flutter/material.dart';
import '../providers/cartProvider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  CartItemWidget(
      this.id, this.productId, this.price, this.quantity, this.title);
  @override
  Widget build(BuildContext context) {
    final cartContainer = Provider.of<Cart>(context,listen: false);
    return Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cartContainer.removeItem(productId);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading:
                    CircleAvatar(child: FittedBox(child: Text('\$${price}'))),
                title: Text(title),
                subtitle: Text("\$${price * quantity}"),
                trailing: Text("x${quantity}"),
              )),
        ));
  }
}
