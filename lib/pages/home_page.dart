import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';
import 'package:gas_monitoring/controllers/weight_controller.dart';
import 'package:gas_monitoring/widgets/data_section.dart';
import 'package:gas_monitoring/widgets/header.dart';
import 'package:gas_monitoring/widgets/meter_section.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final WeightController controller = Get.find<WeightController>();
  int random = Random().nextInt(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: AppHeader(),
          ),
          Expanded(
            child: DataSection(),
          ),
          Expanded(
            child: MeterSection(),
          ),
          GestureDetector(
            onTap: () {
              random = Random().nextInt(100);
              controller.setWeight(random.toDouble());
            },
            child: Container(
              height: 50.0,
              width: 150.0,
              margin: EdgeInsets.only(bottom: 50.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: customShadow,
              ),
              child: Center(
                  child: Text(
                'Query Weight',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
