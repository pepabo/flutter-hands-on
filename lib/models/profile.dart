import 'package:flutter/material.dart';

class Profile {
  final int id;
  final String url;
  final String body;
  final String headerUrl;
  Profile(
      {@required this.id,
      @required this.url,
      @required this.body,
      @required this.headerUrl});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as int,
      body: json['body'] as String ?? "",
      url: json['url'] as String ?? "",
      headerUrl: json['headerUrl'] as String ?? "",
    );
  }
}
