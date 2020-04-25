import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/user.dart';

class LoginStateStore extends ChangeNotifier {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  User _currentUser;
  User get currentUser => _currentUser;

  login(User user) {
    _currentUser = user;
    _loggedIn = true;
    notifyListeners();
  }

  logout() {
    _currentUser = null;
    _loggedIn = false;
    notifyListeners();
  }
}
