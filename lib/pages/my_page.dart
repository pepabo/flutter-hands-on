import 'package:flutter/material.dart';
import 'package:flutter_hands_on/models/user.dart';
import 'package:flutter_hands_on/stores/login_state_store.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LoginStateStore>(context);
    return store.loggedIn
        ? _loggedInSection(context, store.currentUser)
        : _notLoggedInSection(context);
  }

  Widget _loggedInSection(BuildContext context, User user) {
    return Center(
      child: Text(user.name),
    );
  }

  Widget _notLoggedInSection(BuildContext context) {
    return Center(
      child: Text("ログインする"),
    );
  }
}
