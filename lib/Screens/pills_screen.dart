import 'package:deltahacks/components/popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deltahacks/components/pill.dart';
import 'package:deltahacks/components/pillTile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../googleauth.dart';

// const data = {
//   {"name": "pill1", "Pills Left": 7, "Schedule": "1,0,1,2,0,1,0"},
//   {"name": "pill2", "Pills Left": 20, "Schedule": "1,0,1,2,0,1,0"}
// };

class PillsPage extends StatefulWidget {
  final VoidCallback voidCallback;

  PillsPage({this.voidCallback});

  @override
  _PillsState createState() => _PillsState(voidCallback: this.voidCallback);
}

class _PillsState extends State<PillsPage> {
  final VoidCallback voidCallback;

  _PillsState({this.voidCallback});

  @override
  void initState() {
    _getThingsOnStartup().then((value) => print("Async Done"));
    super.initState();
  }

  Future _getThingsOnStartup() async {
    await fireStore.getDBVal();
    // await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listOfPills.length,
          itemBuilder: (BuildContext context, int index) {
            return PillTile(index);
          }),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: FloatingActionButton.extended(
            onPressed: () {
              return AddViewPopup(this.voidCallback).popup(context);
            },
            label: Icon(Icons.add),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

// bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.blueAccent,
//         items: <Widget>[
//           Icon(Icons.analytics),
//           Icon(Icons.home),
//           Icon(Icons.medical_services_rounded)
//         ],
//         onTap: (index) {
//           setState(() {
//             _page = index;
//           });
//         },
//       )
