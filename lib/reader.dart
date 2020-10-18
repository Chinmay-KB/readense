import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:http/http.dart' as http;
import 'package:readense/readerArgs.dart';

class Reader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReaderArgs args = ModalRoute.of(context).settings.arguments;
    print("URL received is ${args.url}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Readense",
          style: TextStyle(
              fontFamily: 'Piazolla',
              fontSize: 24,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: getResult(args.url),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else {
              return SingleChildScrollView(
                child: Html(
                  data: snapshot.data,
                  style: {
                    "html": Style(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      fontFamily: 'Piazolla',
                      fontSize: FontSize(18),
                    )
                  },
                ),
              );
            }
          }),
    );
  }

  Future<String> getResult(String url) async {
    String prefix = "https://readense.herokuapp.com/fetch?url=";
    http.Response res = await http.get(prefix + url);
    // print(res.statusCode);
    // return "String is ${res.statusCode}";
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print(data['content']);
      return data['content'];
    } else
      return "Something went wrong!";
  }
}
