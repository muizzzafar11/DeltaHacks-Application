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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      listOfPills[index].name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w200,
                        color: HexColor('#0052D4'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      (50 - listOfPills[index].pillsLeft).toString() +
                          " Pills Left in Dispenser",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: HexColor('#0052D4'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SleekCircularSlider(
                      appearance: appearance01,
                      initialValue:
                          50.0 - listOfPills[index].pillsLeft.toDouble(),
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
    trackColor: HexColor('#0052D4').withOpacity(0.6),
    progressBarColors: [
      HexColor('#0083B0').withOpacity(0.5),
      HexColor('#2193b0').withOpacity(0.9),
      HexColor('#6dd5ed').withOpacity(0.9),
    ],
    shadowColor: HexColor('#0052D4'),
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
