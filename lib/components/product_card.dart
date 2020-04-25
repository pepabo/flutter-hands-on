import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.network(product.sampleImageUrl),
            SizedBox(
              height: 40,
              child: Text(product.title),
            ),
            Text("${product.price.toString()}円"),
          ],
        ));
  }
}
