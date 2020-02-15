import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/search_results_pull.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/single_child_details_page.dart';

class children_list extends StatefulWidget {
  @override
  final FatherName;
  final SearchParameterFatherMother_CNIC;
  children_list({this.SearchParameterFatherMother_CNIC, this.FatherName});

  _children_listState createState() => _children_listState();
}

class _children_listState extends State<children_list> {
  @override
  Widget build(BuildContext context) {
    set_pageName('Children of Mr.'+ widget.FatherName);
    return Scaffold(
      appBar: PreferredSize(child: myappbar(), preferredSize: Size(35.0, 60.0)),
      body: new FutureBuilder(
          future: searchChildForImmunization(widget.SearchParameterFatherMother_CNIC),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: child_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    /*Your widget code goes here instead of the ListTile*/
                    return ListTile(
                      title: Card(
                        margin: EdgeInsets.all(5),
                        elevation: 5.0,
                        child: InkWell(child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Container(
                              child: new Image.asset(child_list[index].icon, width: 30, height: 30,),
                              decoration: new BoxDecoration (
                                  borderRadius: new BorderRadius.all(new Radius.circular(1000)),
                                  color: Colors.black
                              ),
                              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                            ),
                            new Container(
                              child: new Text (child_list[index].child_Sex,
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900
                                  )
                              ),
                              decoration: new BoxDecoration (
                                  borderRadius: new BorderRadius.all(new Radius.circular(1000)),
                                  color: Colors.black
                              ),
                              padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                            ),
                            Text("      Date of Birth:" + child_list[index].child_birth_date)
                          ],),onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>single_child_details(child_list[index].child_key, widget.SearchParameterFatherMother_CNIC) ));
                        },),),);
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
