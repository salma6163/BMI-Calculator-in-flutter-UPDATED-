import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter/widgets.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:bmi_calculator_in_flutter/percent.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedGender = 0, height = 20, age = 1, weight = 20;
  String chickBMI = 'nice';
  double bmi = 0;

  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(103, 159, 14, 185),
        title: Center(
            child: Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
        )),
        toolbarHeight: 90.spMin,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        gender(),
        heightInput(),
        weight_age(),
        bmi_result(),
        Positioned(
          child: _getRadialGauge(),
        ),
        colors_check(),
        SizedBox(
          height: 11.h,
        ),
        Positioned(
          child: calc(),
        )
      ],
    );
  }

  Widget _getRadialGauge() {
    return Container(
      height: 155.h,
      width: 155.w,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(minimum: 0, maximum: 40, ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 18.5,
              color: Colors.blue,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 25,
              endValue: 29.9,
              color: Colors.orange,
              startWidth: 10,
              endWidth: 10),
          GaugeRange(
              startValue: 30,
              endValue: 39.9,
              color: Colors.red,
              startWidth: 10,
              endWidth: 10),
        ], pointers: <GaugePointer>[
          NeedlePointer(
            needleColor: Colors.black,
            value: bmi,
            enableAnimation: true,
          ),
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Container(
                  child: Text('${bmi.toStringAsFixed(1)}',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),
              angle: 90,
              positionFactor: .5)
        ])
      ]),
    );
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

  Widget calc() {
    return Container(
      height: 40.h,
      width: 115.w,
      child: FloatingActionButton(
        shape: BeveledRectangleBorder(
            side: BorderSide(
          color: Colors.black12,
          width: 2.w,
        )),
        onPressed: () {
          setState(() {
            bmi = weight / (pow(height / 100, 2));
          });
        },
        child: Container(
          padding: EdgeInsets.all(5.w),
          child: Row(
            children: [
              Icon(
                Icons.calculate,
                size: 30,
              ),
              Text(
                "Calculate",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heightInput() {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Text(
          "Height",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Slider(
            min: 0,
            max: 200,
            divisions: 200,
            value: height.toDouble(),
            onChanged: (value) {
              setState(() {
                height = value.toInt();
              });
            }),
        Text(
          "Your Height=$height cm",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  Widget gender() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedGender = 0;
                  });
                },
                icon: Icon(Icons.male),
                color: selectedGender == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
                iconSize: 60,
              ),
              Text(
                "man",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedGender = 1;
                  });
                },
                icon: Icon(Icons.female),
                color: selectedGender == 1
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black,
                iconSize: 60,
              ),
              Text(
                "woman",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget weight_age() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 13),
            child: Column(
              children: [
                Text(
                  "Weight",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ItemCount(
                    textStyle:
                        TextStyle(fontSize: 1, fontWeight: FontWeight.bold),
                    buttonSizeHeight: 30,
                    buttonSizeWidth: 50,
                    initialValue: weight,
                    minValue: 0,
                    maxValue: 200,
                    onChanged: (value) {
                      setState(() {
                        weight = value.toInt();
                      });
                    },
                    decimalPlaces: 00),
              ],
            )),
        SizedBox(
          width: 55.w,
        ),
        Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Text(
                  "Age",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ItemCount(
                    textStyle:
                        TextStyle(fontSize: 1, fontWeight: FontWeight.bold),
                    buttonSizeHeight: 30,
                    buttonSizeWidth: 50,
                    initialValue: age,
                    minValue: 0,
                    maxValue: 200,
                    onChanged: (value) {
                      setState(() {
                        age = value.toInt();
                      });
                    },
                    decimalPlaces: 00),
              ],
            )),
      ],
    );
  }

  Widget bmi_result() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Text(
        "BMI result = ${bmi.toStringAsFixed(1)}",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
      ),
    );
  }
}
