import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';

class CustomButton extends StatelessWidget {
  final String? textButton;

  const CustomButton({Key? key, this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        boxShadow: customShadow,
      ),
      child: Text(
        textButton!,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
