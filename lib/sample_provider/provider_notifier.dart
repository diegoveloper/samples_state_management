import 'package:flutter/foundation.dart';

class ProviderNotifier with ChangeNotifier {
  int counter = 0;
  bool isDark = false;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void resetCounter() {
    counter = 0;
    notifyListeners();
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
