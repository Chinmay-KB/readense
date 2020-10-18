import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:readense/home.dart';
import 'package:readense/reader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.black87),
      routes: {'/reader': (context) => Reader()},
      home: Home(),
    );
  }
}
