import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';
import '../models/product.dart';
import '../providers/productProviders.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user/product/screen';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductProvider>(context,listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final List<Product> products = productData.getProducts;
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(title: const Text("Your Products"), actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add))
        ]),
        body: RefreshIndicator(
          onRefresh: ()=>_refreshProducts(context),
          child: ListView.builder(
            itemBuilder: (_, index) => UserProductItemWidget(products[index]),
            itemCount: products.length,
          ),
        ));
  }
}
