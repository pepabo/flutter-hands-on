import 'package:flutter_hands_on/item.dart';
import 'package:flutter_hands_on/material.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final int discountedPrice;
  final String imageUrl;
  final List<String> imageUrls;
  final String sampleImageUrl;
  final List<String> sampleImageUrls;
  final String sampleUrl;
  final int quantityLimit;
  final int remainingQuantity;
  final Item item;
  final SuzuriMaterial material;

  Product({
    this.id,
    this.title,
    this.price,
    this.discountedPrice,
    this.imageUrl,
    this.imageUrls,
    this.sampleImageUrl,
    this.sampleImageUrls,
    this.sampleUrl,
    this.quantityLimit,
    this.remainingQuantity,
    this.item,
    this.material,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String ?? "",
      price: json['price'] as int,
      discountedPrice: json['discountedPrice'] as int,
      imageUrl: json['imageUrl'] as String,
      imageUrls: json['imageUrls'].cast<String>() as List<String>,
      sampleImageUrl: json['sampleImageUrl'] as String,
      sampleImageUrls: json['sampleImageUrls'].cast<String>() as List<String>,
      sampleUrl: json['sampleUrl'] as String,
      quantityLimit: json['quantityLimit'] as int ?? 0,
      remainingQuantity: json['remainingQuantity'] as int ?? 0,
      item: Item.fromJson(json['item']),
      material: SuzuriMaterial.fromJson(json['material']),
    );
  }
}
