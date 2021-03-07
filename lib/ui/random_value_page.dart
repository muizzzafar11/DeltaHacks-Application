import 'dart:math';
import './utils.dart';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../components/pill.dart';
import '../components/pillTile.dart';

class RandomValuePage extends StatefulWidget {
  @override
  _RandomValuePageState createState() => _RandomValuePageState();
}

class _RandomValuePageState extends State<RandomValuePage> {
  int _currentValue = 50;

  void _generateRandomValue() {
    final randomizer = Random();
    _currentValue = randomizer.nextInt(100);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: listOfPills.length,
          itemBuilder: (BuildContext context, int index) {
       
            return Container(
            child: SafeArea(
                child: Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                                        Text(listOfPills[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                              color: HexColor('#BD0016'))),
                    SleekCircularSlider(
                      appearance: appearance01,
                      initialValue: Random().nextInt(100).toDouble(),
                    ),

                  ]),
            )));
          }),
);
  }
}

final customWidth01 =
    CustomSliderWidths(trackWidth: 2, progressBarWidth: 20, shadowWidth: 50);
final customColors01 = CustomSliderColors(
    dotColor: Colors.white.withOpacity(0.8),
    trackColor: HexColor('#FF8282').withOpacity(0.6),
    progressBarColors: [
      HexColor('#FFE2E2').withOpacity(0.9),
      HexColor('#FFAD8D').withOpacity(0.9),
      HexColor('#FE6490').withOpacity(0.5)
    ],
    shadowColor: HexColor('#FFD7E2'),
    shadowMaxOpacity: 0.08);

final info = InfoProperties(
    mainLabelStyle: TextStyle(
        color: Colors.white, fontSize: 60, fontWeight: FontWeight.w100));

final CircularSliderAppearance appearance01 = CircularSliderAppearance(
    customWidths: customWidth01,
    customColors: customColors01,
    infoProperties: info,
    startAngle: 180,
    angleRange: 180,
    size: 250.0);