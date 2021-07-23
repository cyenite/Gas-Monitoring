import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';

import 'cylinder_details.dart';

class DataSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text('Number of gas cylinders: ${cylinders.length}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cylinders.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var cylinder = cylinders[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: customShadow,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 150,
                      bottom: -200,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: customShadow,
                            shape: BoxShape.circle,
                            color: Colors.white38),
                      ),
                    ),
                    Positioned.fill(
                      left: -300,
                      top: -100,
                      bottom: -100,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: customShadow,
                            shape: BoxShape.circle,
                            color: Colors.white38),
                      ),
                    ),
                    CylinderDetails(
                      cylinderName: cylinder['name'],
                      volume: cylinder['volume'],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
