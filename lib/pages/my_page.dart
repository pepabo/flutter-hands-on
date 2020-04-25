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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          user.profile.headerUrl.isEmpty
              ? Container()
              : SizedBox(
                  height: 200,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.network(user.profile.headerUrl),
                  ),
                ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.avatarURL,
                    height: 100,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(user.profile.body),
          ),
          Row(
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<LoginStateStore>(context, listen: false).logout();
                },
                child: Container(
                  child: Text(
                    "ログアウト",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, right: 24, left: 24),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _notLoggedInSection(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          Provider.of<LoginStateStore>(context, listen: false).login();
        },
        child: Container(
          child: Text(
            "ログインする",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.only(top: 8, bottom: 8, right: 24, left: 24),
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(
                8.0,
              )),
        ),
      ),
    );
  }
}
