import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall/models/model_auth.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Profile'),
        TextButton(
          onPressed: () async {
            await authClient.logout();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text('로그아웃 되었습니다.')),
              );
            Navigator.of(context).pushReplacementNamed('/login');
          },
          child: Text('Logout'),
        ),
      ],
    ));
  }
}
