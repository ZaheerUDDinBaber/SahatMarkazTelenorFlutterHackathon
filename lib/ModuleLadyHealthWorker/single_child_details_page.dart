import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/search_results_pull.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/models/child_model.dart';

class single_child_details extends StatefulWidget {
  @override
  String child_key;
  String SearchParameterFatherMother_CNIC;
  single_child_details(this.child_key, this.SearchParameterFatherMother_CNIC);
  _single_child_detailsState createState() => _single_child_detailsState();
}

class _single_child_detailsState extends State<single_child_details> {
  @override
  /////////////////
  Widget build(BuildContext context) {
    set_pageName('Vaccination Chart of Child: '+ widget.child_key);
    return Scaffold(
      appBar: PreferredSize(child: myappbar(), preferredSize: Size(35.0, 60.0)),
      body: new FutureBuilder(
          future: searchDetailsSingleChildForImmunization(widget.SearchParameterFatherMother_CNIC,widget.child_key),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Card(
                  margin: EdgeInsets.all(5),
                  elevation: 3.0,
                  color: Color(0xFFFF8F00),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Divider(color: Color(0xFFFF8F00),),
                    Divider(color: Color(0xFFFF8F00),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text("Sex: "+chaild_details.child_Sex+" |   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("Date of Birth: "+chaild_details.child_birth_date+" |   ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("Time of Birth: "+chaild_details.child_birth_time+"",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                    ],),
                    Divider(color: Color(0xFFFF8F00)),
                    Divider(color: Color(0xFFFF8F00)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Height: "+chaild_details.child_height+"   |   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text("Weight: "+chaild_details.child_weight+"   |   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text("Hospital: "+chaild_details.child_birth_hospital_name+"   |   ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text("City: "+chaild_details.child_birth_city+"",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      ],),

                    Divider(color: Color(0xFFFF8F00)),
                    Divider(color: Color(0xFFFF8F00)),

                  ],
                ),),
                  Card(
                  margin: EdgeInsets.all(5),
                  //elevation: 5.0,
                  child:Column(children: <Widget>[
                    Row(children: <Widget>[
                      Text("Number",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("         Age",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("                                        Vaccination", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],),
                    Divider(),
                    Divider(color: Colors.white,),
                    // 3 vacinations are not included : from row 2 to 4 due to low page size,
                    // they have mapped with firebase , just need to add if needed//

                    // birth - row 1 //
                    Row(children: <Widget>[
                      Text("1",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("               After Birth",style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: <Widget>[
                        Text("            BCG "),
                        Checkbox(
                          value: vaccination_chart.bcg,
                          onChanged: !vaccination_chart.bcg ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'bcg': value.toString()
                            });
                            vaccination_chart.bcg = value;
                            setState(() {

                            });
                          } : null,
                        ),
                        Text("  OPV-0"),
                        Checkbox(
                          value: vaccination_chart.opv0,
                          onChanged: !vaccination_chart.opv0 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'opv0': value.toString()
                            });
                            vaccination_chart.opv0 = value;
                            setState(() {

                            });
                          } : null,
                        ),
                        Text("       HAP-B"),
                        Checkbox(
                          value: vaccination_chart.hapb,
                          onChanged: !vaccination_chart.hapb ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'hapb': value.toString()
                            });
                            vaccination_chart.hapb = value;
                            setState(() {
                            });
                          } : null,
                        )
                      ],),

                    ],),
                    // Six Weeks - row 2 //
                    Row(children: <Widget>[
                      Text("2",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("               Six Weeks",style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: <Widget>[
                        Text("          OPV-1"),
                        Checkbox(
                          value: vaccination_chart.opv1,
                          onChanged: !vaccination_chart.opv1 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'opv1': value.toString()
                            });
                            vaccination_chart.opv1 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                        Text("ROTA-1"),
                        Checkbox(
                          value: vaccination_chart.rota1,
                          onChanged: !vaccination_chart.rota1 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'rota1': value.toString()
                            });
                            vaccination_chart.rota1 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                        Text("NEWMO-1"),
                        Checkbox(
                          value: vaccination_chart.newmoko1,
                          onChanged: !vaccination_chart.newmoko1 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'newmoko1': value.toString()
                            });
                            vaccination_chart.newmoko1 = value;
                            setState(() {
                            });
                          } : null,
                        ),

                      ],),

                    ],),
                    // Ten Weeks - row 3//
                    Row(children: <Widget>[
                      Text("3",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("               Ten Weeks",style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: <Widget>[
                        Text("         OPV-2"),
                        Checkbox(
                          value: vaccination_chart.opv2,
                          onChanged: !vaccination_chart.opv2 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'opv2': value.toString()
                            });
                            vaccination_chart.opv2 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                        Text("ROTA-2"),
                        Checkbox(
                          value: vaccination_chart.rota2,
                          onChanged: !vaccination_chart.rota2 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'rota2': value.toString()
                            });
                            vaccination_chart.rota1 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                        Text("   PENTA-2"),
                        Checkbox(
                          value: vaccination_chart.penta2,
                          onChanged: !vaccination_chart.penta2 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'penta2': value.toString()
                            });
                            vaccination_chart.penta2 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                      ],),

                    ],),
                    // 14 Weeks - row 4//
                    Row(children: <Widget>[
                      Text("4",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("               14 Weeks",style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: <Widget>[
                        Text("            OPV-3"),
                        Checkbox(
                          value: vaccination_chart.opv3,
                          onChanged: !vaccination_chart.opv3 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'opv3': value.toString()
                            });
                            vaccination_chart.opv3 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                        Text("IPV       "),
                        Checkbox(
                          value: vaccination_chart.ipv,
                          onChanged: !vaccination_chart.ipv ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'ipv': value.toString()
                            });
                            vaccination_chart.ipv = value;
                            setState(() {
                            });
                          } : null,
                        ),
                        Text("   PENTA-3"),
                        Checkbox(
                          value: vaccination_chart.penta3,
                          onChanged: !vaccination_chart.penta3 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'penta3': value.toString()
                            });
                            vaccination_chart.penta3 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                      ],),

                    ],),
                    // 9 Months - row 5//
                    Row(children: <Widget>[
                      Text("5",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("               9 Months",style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: <Widget>[
                        Text("            MILZ-1"),
                        Checkbox(
                          value: vaccination_chart.mazlaz1,
                          onChanged: !vaccination_chart.mazlaz1 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'mazlaz1': value.toString()
                            });
                            vaccination_chart.mazlaz1 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                      ],),

                    ],),
                    // 15 Months - row 6//
                    Row(children: <Widget>[
                      Text("6",style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("               15 Months",style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(children: <Widget>[
                        Text("          MILZ-2"),
                        Checkbox(
                          value: vaccination_chart.mazlaz2,
                          onChanged: !vaccination_chart.mazlaz2 ? (bool value) {
                            DatabaseReference update_vaccination=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+widget.SearchParameterFatherMother_CNIC+"/Children/"+widget.child_key+"/");
                            update_vaccination.child('immunisation').update({
                              'mazlaz2': value.toString()
                            });
                            vaccination_chart.mazlaz2 = value;
                            setState(() {
                            });
                          } : null,
                        ),
                      ],),

                    ],)
                  ],)
                  )
              ],) );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
