import 'package:flutter/material.dart';
import 'package:gas_monitoring/controllers/weight_controller.dart';
import 'package:gas_monitoring/utils/root.dart';
import 'package:get/get.dart';

void main() {
  Get.put(WeightController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gas Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(),
    );
  }
}
