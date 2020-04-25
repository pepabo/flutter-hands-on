import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("商品詳細"),
      ),
      body: Container(
        child: Center(
          child: Text(
            product.title,
          ),
        ),
      ),
    );
  }
}
