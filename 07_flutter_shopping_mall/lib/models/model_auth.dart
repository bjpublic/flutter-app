import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  registerSuccess,
  registerFail,
  loginSuccess,
  loginFail,
}

class FirebaseAuthProvider with ChangeNotifier {
  FirebaseAuth authClient;
  User? user;

  FirebaseAuthProvider({auth}) : authClient = auth ?? FirebaseAuth.instance;

  Future<AuthStatus> registerWithEmail(String email, String password) async {
    try {
      UserCredential credential = await authClient
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthStatus.registerSuccess;
    } catch (e) {
      print(e);
      return AuthStatus.registerFail;
    }
  }

  Future<AuthStatus> loginWithEmail(String email, String password) async {
    try {
      await authClient
          .signInWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        user = credential.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        prefs.setString('email', email);
        prefs.setString('password', password);
      });
      print("[+] 로그인유저 : " + user!.email.toString());
      return AuthStatus.loginSuccess;
    } catch (e) {
      print(e);
      return AuthStatus.loginFail;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    prefs.setString('email', '');
    prefs.setString('password', '');
    user = null;
    await authClient.signOut();
    print("[-] 로그아웃");
  }
}
