import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deltahacks/Screens/pills_screen.dart';
import 'package:deltahacks/components/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditViewPopup {
  final String title;
  int numberOfPills, pillPerDay, index;

  EditViewPopup({this.title, this.index});
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
                    onChanged: (text) {
                      numberOfPills = int.parse(text);
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Total Pills"),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (text) {
                      pillPerDay = int.parse(text);
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pills per Day"),
                  )),
              Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                    onPressed: () {
                      listOfPills[index].pillsLeft = numberOfPills;
                      listOfPills.forEach((element) {
                        print(element.schedule);
                      });
                      listOfPills[index].schedule =
                          List<int>.generate(7, (index) => pillPerDay);
                      // listOfPills.forEach((element) {
                      //   print("-----------------");
                      //   print(element.name);
                      //   print(element.pillsLeft);
                      //   print(element.schedule);
                      // });
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

class AddViewPopup {
  String name;
  int numberOfPills, pillPerDay;

  popup(context) {
    return AwesomeDialog(
      context: context,
      title: "Add Pill",
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
                    "Add Pill",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 30),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (text) {
                      name = text;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Name"),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (text) {
                      numberOfPills = int.parse(text);
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Total Pills"),
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (text) {
                      pillPerDay = int.parse(text);
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pills per Day"),
                  )),
              Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                    onPressed: () {
                      listOfPills.add(Pill(
                          name: name,
                          pillsLeft: numberOfPills,
                          schedule:
                              List<int>.generate(7, (index) => pillPerDay)));
                      // listOfPills.forEach((element) {
                      //   print(element.schedule);
                      // });
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
