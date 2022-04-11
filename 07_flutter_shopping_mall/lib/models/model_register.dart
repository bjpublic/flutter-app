import 'package:flutter/material.dart';

class RegisterFieldModel extends ChangeNotifier {
  String email = "";
  String password = "";
  String passwordConfirm = "";

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  void setPasswordConfirm(String passwordConfirm) {
    this.passwordConfirm = passwordConfirm;
    notifyListeners();
  }
}
