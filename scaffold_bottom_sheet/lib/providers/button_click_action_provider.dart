import 'package:flutter/material.dart';

class ButtonClickActionProvider extends ChangeNotifier {
  String _buttonOneClickedText = "";
  String _buttonTwoClickedText = "";
  int count1 = 0;
  int count2 = 0;

  String get buttonOneClickedText => _buttonOneClickedText;
  String get buttonTwoClickedText => _buttonTwoClickedText;

  void buttonOneClicked() {
    _buttonOneClickedText = "Button One clicked ${count1++} times.";
    notifyListeners();
  }

  void buttonTwoClicked() {
    _buttonTwoClickedText = "Button Two clicked ${count2++} times.";
    notifyListeners();
  }

  void resetTexts() {
    _buttonOneClickedText = "";
    _buttonTwoClickedText = "";
    notifyListeners();
  }
}
