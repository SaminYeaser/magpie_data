import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimationData extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationData> {

  List datam = new List();
  getDetails() async{
    List data = await getData();
    datam = data;
    setState(() {

    });
  }
  @override
  void initState() {
      getDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magpie Data'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: datam.length,
          itemBuilder: (BuildContext context, int position) {
            return Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                title: Text("${datam[position]['date']}"),
                subtitle: Text("""
                  close: ${datam[position]['close']}
                  high: ${datam[position]['high']}
                  low: ${datam[position]['low']}
                  open: ${datam[position]['open']}
                  trade_code: ${datam[position]['trade_code']}
                  volume: ${datam[position]['volume']}
                  
                """),
              ),
            );
          },
        ),
      ),
    );
  }
}
Future<List> getData() async {
  String api = "https://magpiedata-15eaf.firebaseio.com/.json";
  http.Response response = await http.get(api);
  return jsonDecode(response.body);
}
