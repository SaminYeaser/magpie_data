import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magpie_data/view/showData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Widget AppBarText() {
  return TweenAnimationBuilder(
    child: Text(
      'Magpie Data',
      style: TextStyle(
          fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    duration: Duration(milliseconds: 500),
    tween: Tween<double>(begin: 0, end: 1),
    builder: (BuildContext context, _val, Widget child) {
      return Opacity(
        opacity: _val,
        child: Padding(
          padding: EdgeInsets.only(top: _val *20),
          child: child,
        ),
      );
    },
  );
}
Widget showingList(){
//  var datas = getData();
  return DataTable(columns:[
    DataColumn(label: Text('Date'),numeric: false),
    DataColumn(label: Text('Close'),numeric: false),
    DataColumn(label: Text('High'),numeric: false),
    DataColumn(label: Text('Low'),numeric: false),
    DataColumn(label: Text('Open'),numeric: false),
    DataColumn(label: Text('Trade_code'),numeric: false),
    DataColumn(label: Text('Volume'),numeric: false),
  ],
    rows: [

    ]
    ,);
}

Widget _buildBody(BuildContext context) {
  return StreamBuilder(
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return DataTable(
          columns: [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Votes')),
            DataColumn(label: Text('Rapper\nname')),
          ],
          rows: [

          ]
      );
    },
  );
}


