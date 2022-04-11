import 'package:flutter/material.dart';

class LoginFieldModel extends ChangeNotifier {
  String email = "";
  String password = "";

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}
