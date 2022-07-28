import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      home: ProductOverViewScreen(),
      theme:ThemeData(
        primarySwatch: Colors.blue,
      )
    );
  }
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("My Shop")),
      body: Center(child: Text("Hey this is for testing")),
    );
  }
}