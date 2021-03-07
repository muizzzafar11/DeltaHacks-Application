import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pill.dart';
import 'popup.dart';

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
            onTap: () => EditViewPopup(
                    title: listOfPills[widget.index].name, index: widget.index)
                .popup(context),
            child: Icon(Icons.create_rounded),
          ),
        ));
  }
}
