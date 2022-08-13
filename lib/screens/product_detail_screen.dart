import 'package:flutter/material.dart';
import '../providers/productProviders.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productData = Provider.of<ProductProvider>(context, listen: false);
    final passedProduct = productData.getProductById(productId);
    return Scaffold(
        appBar: AppBar(title: Text('${passedProduct.title}')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child:
                      Image.network(passedProduct.imageUrl, fit: BoxFit.cover)),
              SizedBox(height: 10),
              Text('\$${passedProduct.price}',
                  style: TextStyle(color: Colors.grey, fontSize: 20)
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    child: Text(passedProduct.description,textAlign: TextAlign.center,softWrap: true,)
                    )
            ],
          ),
        ));
  }
}
