import 'package:deltahacks/components/popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deltahacks/components/pill.dart';
import 'package:deltahacks/components/pillTile.dart';

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
  bool flag = false;
  bool prevFlag = true;
  int arrLen = 0;

  final VoidCallback voidCallback;

  _PillsState({this.voidCallback});

  @override
  void initState() {
    // _getThingsOnStartup().then((value) => print("Async Done"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(bottom: 110, top: 20, left: 10, right: 10),
          child: ListView.builder(
              itemCount: listOfPills.length,
              itemBuilder: (BuildContext context, int index) {
                return PillTile(index);
              })),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: FloatingActionButton.extended(
            onPressed: () {
              return AddViewPopup(this.voidCallback).popup(context);
            },
            label: Icon(Icons.add),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
