import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';
import '../widgets/productDisplayWidget.dart';
import '../widgets/productGridWidget.dart';
import '../providers/productProviders.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShop"), actions: <Widget>[
        PopupMenuButton(
          onSelected: (FilterOptions selectedValue) {
            setState(() {
              if (selectedValue == FilterOptions.Favorites) {
              _showOnlyFavorites = true;
              
            } else {
              _showOnlyFavorites = false;
            }
            });
            
          },
          icon: Icon(
            Icons.more_vert,
          ),
          itemBuilder: (_) => [
            PopupMenuItem(
                child: Text("Only Favorites"), value: FilterOptions.Favorites),
            PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
          ],
        )
      ]),
      body: ProductGridWidget(_showOnlyFavorites),
    );
  }
}
