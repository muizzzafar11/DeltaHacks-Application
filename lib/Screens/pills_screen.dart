import 'package:deltahacks/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

const data = {
  {"name": "pill1", "Pills Left": 7, "Schedule": "1,0,1,2,0,1,0"},
  {"name": "pill2", "Pills Left": 20, "Schedule": "1,0,1,2,0,1,0"}
};

class PillsPage extends StatefulWidget {
  @override
  _PillsState createState() => _PillsState();
}

class _PillsState extends State<PillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listOfPills.length,
          itemBuilder: (BuildContext context, int index) {
            return PillTile(index);
          }),
    );
  }
}

class PillTile extends StatefulWidget {
  final int index;
  PillTile(this.index);
  @override
  _PillTileState createState() => _PillTileState();
}

class _PillTileState extends State<PillTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all()),
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            listOfPills[widget.index].name,
          ),
          trailing: GestureDetector(
            onTap: () => EditViewPopup(title: listOfPills[widget.index].name)
                .popup(context),
            child: Icon(Icons.create_rounded),
          ),
        ));
  }
}

class EditViewPopup {
  final String title;
  int numberOfPills, pillPerDay;

  EditViewPopup({this.title});
  popup(context) {
    return AwesomeDialog(
      context: context,
      title: title,
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      animType: AnimType.SCALE,
      body: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 30),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Total Pills"),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pills per Day"),
                  )),
              Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PillsPage();
                      }));
                    },
                    child: Text("Save")),
              )
            ],
          )),
    )..show();
  }
}

// IconButton(
//             icon: Icon(Icons.create_rounded),
//             onPressed: () {
//               setState(() {
//                 print("Pressed!");
//               });
//             },
//           )
