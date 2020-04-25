import 'dart:convert';
import 'dart:io';

import 'package:flutter_hands_on/models/product.dart';
import 'package:flutter_hands_on/models/user.dart';
import 'package:flutter_hands_on/requests/suzuri_api_request.dart';
import 'package:http/http.dart' as http;

class UserRequest extends SuzuriAPIRequest {
  final _path = "/user";

  UserRequest({
    http.Client client,
  }) : super(client: client);

  Future<User> fetchMe() async {
    final path = prefix + _path;
    final uri = Uri.https(authority, path);
    final response = await client.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: authorization},
    );
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return User.fromJson(decoded["user"]);
    } else {
      throw Exception("request failed");
    }
  }
}
