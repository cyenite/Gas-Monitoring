import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';
import 'package:gas_monitoring/controllers/weight_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class CylinderDetails extends StatelessWidget {
  final WeightController controller = Get.find<WeightController>();
  final String cylinderName;
  final double volume;

  CylinderDetails({
    required this.cylinderName,
    required this.volume,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.0),
            child: Container(
              width: 250,
              child: Text(
                cylinderName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green),
              ),
            ),
          ),
        ),
        Obx(() {
          return Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                width: 100,
                child: Center(
                    child: Text(
                  '${controller.volume.value} L',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: customShadow,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          );
        }),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(25),
                    height: 200,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Obx(() {
                              return LiquidCircularProgressIndicator(
                                value: controller.volumePercentage.value *
                                    0.01, // Defaults to 0.5.
                                valueColor: AlwaysStoppedAnimation(Colors
                                        .lightBlue[
                                    500]!), // Defaults to the current Theme's accentColor.
                                backgroundColor: Colors
                                    .white, // Defaults to the current Theme's backgroundColor.
                                borderColor: Colors.blue,
                                borderWidth: 2.0,
                                direction: Axis.vertical,
                                // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                                center: Text("Loading..."), //text inside it
                              );
                            }),
                          ),
                        ),
                        /* Expanded(
                            //Expanded() widget expands inner widget to remaining space
                            child: SizedBox(
                                height: 50,
                                child: LiquidLinearProgressIndicator(
                                  value: 0.45, // Defaults to 0.5.
                                  valueColor: AlwaysStoppedAnimation(Colors
                                          .pink[
                                      100]), // Defaults to the current Theme's accentColor.
                                  backgroundColor: Colors
                                      .white, // Defaults to the current Theme's backgroundColor.
                                  borderColor:
                                      Colors.red, //border color of the bar
                                  borderWidth: 5.0, //border width of the bar
                                  borderRadius: 12.0, //border radius
                                  direction: Axis.horizontal,
                                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                  center: Text("50%"), //text inside bar
                                ))),*/
                      ],
                    )),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 32.0),
            child: Container(
              width: 250,
              child: Text(
                'Estimated Volume',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LiquidLinearProgressIndicator {}
