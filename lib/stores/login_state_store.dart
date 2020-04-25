import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/user.dart';
import 'package:flutter_hands_on/requests/user_request.dart';

import 'package:http/http.dart' as http;

class LoginStateStore extends ChangeNotifier {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  User _currentUser;
  User get currentUser => _currentUser;

  login() async {
    final request = UserRequest(client: http.Client());
    final user = await request.fetchMe();
    if (user != null) {
      _currentUser = user;
      _loggedIn = true;
      notifyListeners();
    }
  }

  logout() {
    _currentUser = null;
    _loggedIn = false;
    notifyListeners();
  }
}
