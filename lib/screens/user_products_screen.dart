import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/user_product_item.dart';
import '../models/product.dart';
import '../providers/productProviders.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user/product/screen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final List<Product> products = productData.getProducts;
    return Scaffold(
      appBar: AppBar(title: const Text("Your Products"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: Icon(Icons.add))
      ]),
      body: ListView.builder(
        itemBuilder: (_, index) => UserProductItemWidget(products[index]),
        itemCount: products.length,
      ),
    );
  }
}