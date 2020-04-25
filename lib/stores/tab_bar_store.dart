import 'package:flutter/cupertino.dart';

class TabBarStore extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  updateCurrentIndex(int index) async {
    assert(index >= 0, "index must be positive value.");
    assert(index < 2, "max index value is 1.");
    print("current index: ${_currentIndex.toString()}");
    _currentIndex = index;
    print("new index: ${_currentIndex.toString()}");
    notifyListeners();
  }
}
