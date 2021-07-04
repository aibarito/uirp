import 'package:flutter/material.dart';

class Balance with ChangeNotifier {
  int balance = 0;

  void increment(int value) {
    balance = balance + value;
    notifyListeners();
  }

  void decrement(int value) {
    balance = balance - value;
    notifyListeners();
  }
}
