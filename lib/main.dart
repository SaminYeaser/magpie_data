import 'package:flutter/material.dart';
import 'view/showData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List _data = await getData();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MagpieData',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Magpie Data'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: ListTile(
                title: Text("${_data[position]['date']}"),
              ),
            );
          },
        ),
      ),
    ),
  ));
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return
//  }
//}

Future<List> getData() async {
  String api = "https://magpiedata-15eaf.firebaseio.com/.json";
  http.Response response = await http.get(api);
  return jsonDecode(response.body);
}
