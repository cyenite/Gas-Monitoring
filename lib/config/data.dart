import 'package:flutter/material.dart';

Color primaryColor = Color(0xFFCADCED);

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: Offset(-5, -5),
      blurRadius: 30),
  BoxShadow(
      color: Colors.blue[900].withOpacity(.2),
      spreadRadius: 2,
      offset: Offset(7, 7),
      blurRadius: 20),
];

List pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
];

List meterValues = [
  {"name": "Full", "amount": 30.0},
  {"name": "Good", "amount": 100.0},
  {"name": "Average", "amount": 50.0},
  {"name": "Critical", "amount": 100.0},
  {"name": "Refill", "amount": 500.0},
];

List cylinders = [
  {"name": "Cylinder 1", "volume": 20.0},
  {"name": "Cylinder 2", "volume": 80.0},
];
