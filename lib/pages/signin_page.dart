import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(Icons.account_circle_outlined),
            ),
            SizedBox(height: 50),
            Container(),
            SizedBox(height: 50),
            Container(),
            SizedBox(height: 50),
            Container(),
          ],
        ),
      ),
    );
  }
}
