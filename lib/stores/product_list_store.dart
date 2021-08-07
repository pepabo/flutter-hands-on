import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';
import 'package:flutter_hands_on/requests/product_request.dart';

import 'package:http/http.dart' as http;

class ProductListStore extends ChangeNotifier{
  
  //実際に管理される商品のリスト
  List<Product> _products = [];
  //外側から変更されないように、getterのみ公開
  List<Product> get products => _products;

  //リクエスト中に再リクエストされないようにする
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  //Storeに変更を要求するインターフェイス
  fetchNextProducts() async {
    if (_isFetching){
        return;
    }
    _isFetching = true;

    //ProductRequestを初期化
    //http.Clientは外から与える
    final request = ProductRequest(
      client: http.Client(),
      offset: _products.length,
    );

    // request.fetchはList<Product>を返すFutureオブジェクトを返す
    final products = await request.fetch().catchError((e){
      _isFetching = false;
    });
    //取得できた商品のリストを追加する
    _products.addAll(products);
    _isFetching = false;
    //追加できたら、このStoreを購読しているウィジェットに通知する
    notifyListeners();
  }

}