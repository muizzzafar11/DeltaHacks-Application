import 'package:flutter/material.dart';
import './random_value_page.dart';
import './utils.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: controller,
      children: <Widget>[
        RandomValuePage(),
      ],
    ));
  }
}
