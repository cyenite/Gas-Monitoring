import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.account_circle_outlined),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
