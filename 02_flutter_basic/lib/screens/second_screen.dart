import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String screenData;
  SecondScreen({required this.screenData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('screenData: ' + screenData),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Go to First Screen'),
            )
          ],
        ),
      ),
    );
  }
}
