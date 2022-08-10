import 'package:flutter/material.dart';
import '../providers/productProviders.dart';
import './productDisplayWidget.dart';
import 'package:provider/provider.dart';

class ProductGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final loadedProducts = productData.getProducts;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
            value:  loadedProducts[index],
            child: ProductDisplayWidget());
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
