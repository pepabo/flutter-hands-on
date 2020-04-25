import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';
import 'package:flutter_hands_on/requests/product_request.dart';

import 'package:http/http.dart' as http;

class ProductListStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products => _products;
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  fetchNextProducts() async {
    if (isFetching) {
      return;
    }
    _isFetching = true;
    final request = ProductRequest(
      client: http.Client(),
      offset: _products.length,
    );
    final products = await request.fetch().catchError((err) {
      _isFetching = false;
    });
    _products.addAll(products);
    print(_products.length);
    _isFetching = false;
    notifyListeners();
  }
}
