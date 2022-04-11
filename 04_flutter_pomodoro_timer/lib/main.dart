import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/screens/timer_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer APP',
      home: TimerScreen(),
    );
  }
}
