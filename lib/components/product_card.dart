import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/product.dart';
import 'package:flutter_hands_on/pages/product_detail.dart';

// statelessWidgetを継承
class ProductCard extends StatelessWidget{
  final Product product;

  // コンストラクタでproductを受け取り、フィールドに格納
  // {}はoptional named parameterと呼ばれるもので、this.productはフィールドにセットするためのシンタックスシュガーです
  ProductCard({this.product});

  @override
  Widget build(BuildContext context){
    // containerをgestureDetectorでラップする
    return GestureDetector(
      onTap: () async {
        // Navigator.of(context).pushNamedで遷移を実行する
        // 第一引数はルーティング名、argumentsはoptionalでパラメータを渡せる
        // ProductDetailで書いた通り、
        // ModalRoute.of(context).settings.argumentsではここの引数が取得できる
        Navigator.of(context).pushNamed(
          ProductDetail.routeName,
          arguments: this.product,
        );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        // columnはwidgetを縦に積むことができるウィジェット
        child: Column(
          // childrenにはList<Widget>を渡す
          // 上から表示したい順にウィジェットを配置する
          children: <Widget>[
            Image.network(product.sampleImageUrl),
            // sizedboxはwidgetを固定するためのwidget
            // heightやwidthを固定すると、childのwidgetがそのサイズになるwidget
            SizedBox(
              height: 40,
              // product.titleは商品名を返す
              child: Text(product.title),
            ),
            // Product.priceには金額が格納されている
            Text('${product.price.toString()}円'),
          ],
        ),
      ),
    );
  }
}