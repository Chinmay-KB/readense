import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readense/reader.dart';
import 'package:readense/readerArgs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "";
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Readense",
            style: TextStyle(
                fontFamily: 'Piazolla',
                fontSize: 48,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Theme(
              data: Theme.of(context).copyWith(
                  textSelectionColor: Colors.black26,
                  cursorColor: Colors.black87),
              child: TextField(
                controller: controller,
                cursorColor: Colors.black87,
                decoration: InputDecoration(
                    hintText: "Paste Link Here",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(4)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/reader',
                      arguments: ReaderArgs(controller.text)),
                  child: Container(child: Text("Readense it!")),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black38))),
              FlatButton(
                  onPressed: () => controller.clear(),
                  child: Container(child: Text("Clear")),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.black38)))
            ],
          )
        ],
      ),
    );
  }
}
