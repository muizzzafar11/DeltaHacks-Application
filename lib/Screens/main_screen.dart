import 'package:flutter/material.dart';
import '../googleauth.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(' ', style: TextStyle(fontSize: 60, color: Colors.black87)),
          Text('Bob', style: TextStyle(fontSize: 60, color: Colors.black87)),
          FlatButton(
              onPressed: () => launch("tel:+1 905 299 0363"),
              child: new Text("Doctor K",
                  style: TextStyle(fontSize: 60, color: Colors.black87))),
          Text('ss', style: TextStyle(fontSize: 32, color: Colors.black87))
        ],
      )),
    );
  }
}
