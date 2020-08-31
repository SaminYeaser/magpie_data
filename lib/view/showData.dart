import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magpie Data'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(),
    );
  }
}
Future<Map> getData() async{
  String api = "https://magpiedata-15eaf.firebaseio.com/.json";
}
