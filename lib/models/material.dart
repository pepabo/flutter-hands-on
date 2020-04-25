import 'package:flutter_hands_on/models/user.dart';

class SuzuriMaterial {
  final int id;
  final int price;
  final String title;
  final String description;
  final bool violation;
  final String dominantRGB;
  final String textureURL;
  final User user;

  SuzuriMaterial({
    this.id,
    this.price,
    this.title,
    this.description,
    this.violation,
    this.dominantRGB,
    this.textureURL,
    this.user,
  });

  factory SuzuriMaterial.fromJson(Map<String, dynamic> json) {
    return SuzuriMaterial(
      id: json['id'] as int,
      price: json['price'] as int,
      title: json['title'] as String ?? "",
      description: json['description'] as String ?? "",
      violation: json['violation'] as bool,
      dominantRGB: json['dominantRGB'] as String ?? "",
      textureURL: json['textureURL'] as String,
      user: User.fromJson(json['user']),
    );
  }
}
