import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sahat_markaz/ModuleReports/reports_data_pull.dart';

class reports_and_data extends StatefulWidget {
  @override

  _reports_and_dataState createState() => _reports_and_dataState();
}

class _reports_and_dataState extends State<reports_and_data> {

  initState() {super.initState();}
  @override
  Widget build(BuildContext context) {
    set_pageName("Reports");
    return Scaffold(
      appBar: PreferredSize(child: myappbar(), preferredSize: Size(35.0, 60.0)),
      body: new FutureBuilder(
          future: loadReportsData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                    children: <Widget>[
                      Card(
                          margin: EdgeInsets.all(15),
                          shape: Border(bottom: BorderSide(color: Color(0xFFFF8F00))),
                          elevation: 3.0,
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Divider(color: Colors.white,),
                                Text("Total Families Registered",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Divider(color: Colors.white,),
                                Text(total_families.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              ])),
                      Card(
                          elevation: 3.0,
                          margin: EdgeInsets.all(15),
                          shape: Border(bottom: BorderSide(color: Color(0xFFFF8F00))),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Divider(color: Colors.white,),
                                Text("Total Children Registered",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                Divider(color: Colors.white,),
                                Text(total_children.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              ])
                      ),
                      Card(
                        elevation: 3.0,
                        margin: EdgeInsets.all(15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("      Gender Percentage",style: TextStyle(fontWeight: FontWeight.bold),),
                            PieChart(
                              dataMap: dataMapPercentage,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery.of(context).size.width / 2.7,
                              showChartValuesInPercentage: true,
                              showChartValues: true,
                              showChartValuesOutside: false,
                              chartValueBackgroundColor: Colors.grey[200],
                              colorList: colorList,
                              showLegends: true,
                              legendPosition: LegendPosition.right,
                              decimalPlaces: 0,
                              showChartValueLabel: true,
                              initialAngle: 0,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: Colors.blueGrey[900].withOpacity(0.9),
                              ),
                              chartType: ChartType.disc,
                            )
                          ],
                        ),),
                      Card(
                        margin: EdgeInsets.all(15),
                        elevation: 3.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("      Gender in Numbers",style: TextStyle(fontWeight: FontWeight.bold),),
                            PieChart(
                              dataMap: dataMapNumbers,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32.0,
                              chartRadius: MediaQuery.of(context).size.width / 2.7,
                              showChartValuesInPercentage: false,
                              showChartValues: true,
                              showChartValuesOutside: false,
                              chartValueBackgroundColor: Colors.grey[200],
                              colorList: colorList,
                              showLegends: true,
                              legendPosition: LegendPosition.right,
                              decimalPlaces: 0,
                              showChartValueLabel: true,
                              initialAngle: 0,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: Colors.blueGrey[900].withOpacity(0.9),
                              ),
                              chartType: ChartType.disc,
                            )
                          ],
                        ),),
                    ],
                  );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}


