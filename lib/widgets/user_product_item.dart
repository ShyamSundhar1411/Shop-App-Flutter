import 'package:flutter/material.dart';
import '../models/product.dart';

class UserProductItemWidget extends StatelessWidget {
  final Product passedProduct;
  UserProductItemWidget(this.passedProduct);
  @override
  Widget build(BuildContext context) {
    print(passedProduct.title);
    return ListTile(
        title: Text(passedProduct.title),
        leading:
            CircleAvatar(backgroundImage: NetworkImage(passedProduct.imageUrl)),
        trailing: Container(
          width: 100,
          child:Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit,color: Theme.of(context).primaryColor,)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Theme.of(context).errorColor,))
          ]),
        ));
  }
}
