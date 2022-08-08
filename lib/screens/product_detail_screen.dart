import 'package:flutter/material.dart';
import '../providers/productProviders.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productData = Provider.of<ProductProvider>(context,listen: false);
    final passedProduct = productData.getProductById(productId);
    return Scaffold(
      appBar: AppBar(title: Text('${passedProduct.title}'))
    );
  }
}
