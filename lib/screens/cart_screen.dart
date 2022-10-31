import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/cartItemDispalyWidget.dart';
import '../providers/cartProvider.dart';
import '../providers/orderProvider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Your Cart")),
        body: Column(
          children: <Widget>[
            Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total", style: TextStyle(fontSize: 20)),
                        SizedBox(width: 10),
                        Chip(
                          label: Text(
                            "\$${cart.totalPrice}",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6
                                    .color),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        OrderButton(cart: cart),
                      ],
                    ))),
            SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) {
                return CartItemWidget(
                    cart.items.values.toList()[index].id,
                    cart.items.keys.toList()[index],
                    cart.items.values.toList()[index].price,
                    cart.items.values.toList()[index].quantity,
                    cart.items.values.toList()[index].title);
              },
            ))
          ],
        ));
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (widget.cart.totalPrice <= 0 || _isloading)
            ? null
            : () async{
                setState(() {
                  _isloading = true;
                });
                await Provider.of<Orders>(context, listen: false).addOrder(
                    widget.cart.items.values.toList(), widget.cart.totalPrice);
                widget.cart.clear();
                setState(() {
                  _isloading = false;
                });
              },
        child: _isloading? CircularProgressIndicator():Text("Order Now", style: TextStyle(color: Colors.white)));
  }
}
