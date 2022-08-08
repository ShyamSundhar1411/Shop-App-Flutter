import 'package:flutter/material.dart';
import '../models//product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product passedProduct;
  ProductDetailScreen(this.passedProduct);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${passedProduct.title}')),
    );
  }
}
