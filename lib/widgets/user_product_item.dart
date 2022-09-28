import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/edit_product_screen.dart';
import 'package:provider/provider.dart';
import '../providers/productProviders.dart';

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
          child: Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName,
                      arguments: passedProduct.id);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                )),
            IconButton(
                onPressed: () {
                  Provider.of<ProductProvider>(context,listen: false)
                      .deleteProduct(passedProduct.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ))
          ]),
        ));
  }
}
