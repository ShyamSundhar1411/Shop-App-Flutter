import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import '../providers/orderProvider.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;
  OrderItemWidget(this.order);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less:Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded) 
            Container(
              padding: EdgeInsets.symmetric(horizontal:15,vertical:4),
              height: min(widget.order.products.length*20.0+10,180),
              child:ListView(children:widget.order.products.map((prod)=>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(prod.title,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                  ),
                  Text("${prod.quantity}x \$${prod.price}",style:TextStyle(fontSize: 18,color: Colors.grey))
                ],
              )).toList(),),
              )
        ],
      ),
    );
  }
}
