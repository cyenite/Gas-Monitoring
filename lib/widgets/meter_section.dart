import 'package:flutter/material.dart';
import 'package:gas_monitoring/config/data.dart';

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
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}
