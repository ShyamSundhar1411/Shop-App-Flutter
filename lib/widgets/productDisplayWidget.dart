import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import '../models/product.dart';
import '../providers/cartProvider.dart';

class ProductDisplayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productPassed = Provider.of<Product>(context);
    final cartContainer = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: productPassed.id);
            },
            child: Image.network(
              productPassed.imageUrl,
              fit: BoxFit.cover,
            )),
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: Consumer<Product>(
            builder: (context, productPassed, child) => IconButton(
                onPressed: () {
                  productPassed.toggleFavoriteStatus();
                },
                icon: Icon(
                  productPassed.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                color: Colors.redAccent),
          ),
          title: Text(
            productPassed.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cartContainer.addItem(
                  productPassed.id, productPassed.price, productPassed.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Added item to cart !"),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () =>
                        {cartContainer.removeSingleItem(productPassed.id)},
                  )));
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
