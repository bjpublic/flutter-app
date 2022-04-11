import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_data_practice/screens/splash_screen.dart';
// import 'package:flutter_data_practice/screens_sqlite/splash_screen.dart';
import 'package:flutter_data_practice/screens_firebase/splash_screen.dart';

// void main() {
//   runApp(MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List App',
      home: SplashScreen(),
    );
  }
}
