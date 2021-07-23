import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MeterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Meter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: meterValues
                      .map((value) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    pieColors[meterValues.indexOf(value)],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                value['name'],
                                style: TextStyle(fontSize: 18),
                              ),
                            ]),
                          ))
                      .toList(),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(progressBarWidth: 10),
                  animationEnabled: true,
                  animDurationMultiplier: 5,
                  customColors: CustomSliderColors(progressBarColors: [
                    Colors.indigo[400],
                    Colors.blue,
                    Colors.green,
                    Colors.amber,
                    Colors.deepOrange,
                  ]),
                ),
                min: 10,
                max: 100,
                initialValue: 17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
