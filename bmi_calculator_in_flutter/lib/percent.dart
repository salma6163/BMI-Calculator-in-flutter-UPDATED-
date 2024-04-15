import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// ignore: unused_import
import 'package:bmi_calculator_in_flutter/home_screen.dart';

class percent extends StatefulWidget {
  const percent({super.key});

  @override
  State<percent> createState() => _percentState();
}

class _percentState extends State<percent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(103, 159, 14, 185),
        title: Text("BMI Percent"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          _getRadialGauge(),
          SizedBox(
            height: 30,
          ),
          colors_check()
        ],
      ),
    );

    //  _getRadialGauge();
  }

  Widget _getRadialGauge() {
    // ignore: unused_label

    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0,
            endValue: 18.4,
            color: Colors.blue,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 18.5,
            endValue: 24.9,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 25,
            endValue: 29.9,
            color: Colors.green,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 30,
            endValue: 39.9,
            color: Colors.yellow,
            startWidth: 10,
            endWidth: 10),
        GaugeRange(
            startValue: 40,
            endValue: 50,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10)
      ], pointers: <GaugePointer>[
        NeedlePointer(
          value: 90,
          enableAnimation: true,
        ),
      ], annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                child: Text('',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            angle: 90,
            positionFactor: .5)
      ])
    ]);
  }

  Widget colors_check() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.blue,
            ),
            Text("Underweight"),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.orange,
            ),
            Text("Overweight"),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.green,
            ),
            Text("Normal"),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.circle,
              color: Colors.red,
            ),
            Text("Obese"),
          ],
        ),
      ],
    );
  }
}
