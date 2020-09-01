import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widgetList.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:json_table/json_table.dart';

class AnimationData extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationData> {
  List datam = [];

//List _data;
  List<charts.Series<Sales, int>> _seriesLineData;
  var linesalesdata;

  getDetails() async {
    List data = await getData();
    datam = data;

    setState(() {
      print(datam);
    });
  }

  @override
  void initState() {
    getDetails();
    getData();
    _seriesLineData = List<charts.Series<Sales, int>>();
    print(datam);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.table_chart),
            ),
            Tab(
              icon: Icon(Icons.insert_chart),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body:
      TabBarView(
        children: [
          ListView.builder(
            itemCount: datam.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  title: Text("${datam[position]['date']}"),
                  subtitle: Text("""
                      length: ${datam.length}
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
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Sales for the first 5 years',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: charts.LineChart(_seriesLineData,
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: true),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.ChartTitle('Years',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification:
                                  charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Sales',
                              behaviorPosition: charts.BehaviorPosition.start,
                              titleOutsideJustification:
                                  charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle(
                            'Departments',
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<List> getData() async {
    String api = "https://magpiedata-15eaf.firebaseio.com/.json";
    http.Response response = await http.get(api);
    return jsonDecode(response.body);
  }
}

class Sales {
  int time;
  int volume;

  Sales(this.time, this.volume);
}
