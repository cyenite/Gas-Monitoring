import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';
import 'package:gas_monitoring/widgets/data_section.dart';
import 'package:gas_monitoring/widgets/header.dart';
import 'package:gas_monitoring/widgets/meter_section.dart';

class HomePage extends StatelessWidget {
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
        ],
      ),
    );
  }
}
