import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/search_results_pull.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/children_list_page.dart';


class child_immunization_program_page extends StatefulWidget {
  @override
  _child_immunization_program_pageState createState() => _child_immunization_program_pageState();
}

class _child_immunization_program_pageState extends State<child_immunization_program_page> {

  TextEditingController parent_father_cnic_five = new TextEditingController();
  TextEditingController parent_father_cnic_seven = new TextEditingController();
  TextEditingController parent_father_cnic_one = new TextEditingController();
  TextEditingController parent_mother_cnic_five = new TextEditingController();
  TextEditingController parent_mother_cnic_seven = new TextEditingController();
  TextEditingController parent_mother_cnic_one = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    set_pageName("Child Immunization Database");
    return Scaffold(
      appBar: PreferredSize(child: myappbar(), preferredSize: Size(35.0, 60.0)),
      body: SingleChildScrollView(
        child:Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Text("Welcome to Child Immunization Database. Please Enter Below Information to Search Children of Particular Family.", overflow: TextOverflow.clip, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color(0xFFFF8F00)),),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Divider(color: Colors.white,),
            Card(
              elevation: 3.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("  Father CNIC    ", style: TextStyle(fontWeight: FontWeight.bold),),
                      new Flexible(
                        child: new
                        TextField(
                          controller: parent_father_cnic_five,
                          textAlign: TextAlign.left,
                          maxLength: 5,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            hintText: 'XXXXX',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new
                        TextField(
                          controller: parent_father_cnic_seven,
                          textAlign: TextAlign.left,
                          maxLength: 7,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'XXXXXXX',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new
                        TextField(
                          controller: parent_father_cnic_one,
                          textAlign: TextAlign.left,
                          maxLength: 1,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'X',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("  Mother CNIC    ", style: TextStyle(fontWeight: FontWeight.bold),),
                      new Flexible(
                        child: new
                        TextField(
                          controller: parent_mother_cnic_five,
                          textAlign: TextAlign.left,
                          maxLength: 5,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)),
                            hintText: 'XXXXX',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new
                        TextField(
                          controller: parent_mother_cnic_seven,
                          textAlign: TextAlign.left,
                          maxLength: 7,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'XXXXXXX',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      new Flexible(
                        child: new
                        TextField(
                          controller: parent_mother_cnic_one,
                          textAlign: TextAlign.left,
                          maxLength: 1,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'X',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.white,),
              SizedBox(
                width: double.infinity, // match_parent
                child: FlatButton(
                  onPressed: (){
                    // getting ready model with data from fields//
                    double screenWidth = MediaQuery.of(context).size.width;
              String Father_CNIC = parent_father_cnic_five.text + parent_father_cnic_seven.text + parent_father_cnic_one.text;
              String Mother_CNIC = parent_mother_cnic_five.text + parent_mother_cnic_seven.text + parent_mother_cnic_one.text;
              String SearchParameterFatherMother_CNIC = Father_CNIC+Mother_CNIC;
              FutureBuilder search_builder = FutureBuilder(future:searchParentsofChildrenForImmunization(SearchParameterFatherMother_CNIC), builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if(found == true){
                    return Center(child: Card( child: Container(width:screenWidth, height:200,child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Children Information of : $Father_CNIC-$Mother_CNIC ", style: TextStyle(fontWeight: FontWeight.bold),),
                        Divider(color: Colors.white,),
                        Divider(color: Color(0xFFFF8F00)),
                        Divider(color: Colors.white,),
                        Divider(color: Colors.white,),
                        Row(children: <Widget>[
                          Text("  Father Name : "),
                          Text(parentData.child_father_name),
                          Text("  CNIC : "),
                          Text(parentData.child_father_cnic),
                        ],),
                        Row(children: <Widget>[
                          Text("  Mother Name : "),
                          Text(parentData.child_mother_name),
                          Text("  CNIC : "),
                          Text(parentData.child_mother_cnic),
                        ],),

                        Row(children: <Widget>[
                          Text("  Address : "),
                          Text(parentData.child_parents_address),
                          Text("  Number : "),
                          Text(parentData.child_parents_phone),
                        ],),
                        Divider(),
                        SizedBox(
                          width: double.infinity, // match_parent
                          child: FlatButton(
                          onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => children_list(
                                  FatherName: parentData.child_father_name,
                                  SearchParameterFatherMother_CNIC: SearchParameterFatherMother_CNIC,
                                )));
                          },
                            color: Color(0xFFFF8F00),
                          child: Text("Open Children Database",style: TextStyle(color: Colors.white)),
                        ),),
                      ],)),));
                  }else{
                    return Center(child: Card( child: Container(width:screenWidth, height:200,child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Error', style: TextStyle(fontWeight:FontWeight.bold),),
                        Divider(color: Colors.white,),
                        Divider(color: Colors.white,),
                        Text("Not Found Any Children For: $Father_CNIC-$Mother_CNIC ", style: TextStyle(fontWeight: FontWeight.bold),),

                      ],)),));
                  }}
                  else {
                  return Center(child: Card( child: Container(width:screenWidth, height:200,child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Searching for Child against: $Father_CNIC-$Mother_CNIC ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Divider(color: Colors.white,),
                      Divider(color: Colors.white,),
                      CircularProgressIndicator(),
                    ],)),));
                }
              }
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return search_builder;
                },
              );
            },
            color: Color(0xFFFF8F00),
            child: Text("Search",style: TextStyle(color: Colors.white),),
          ),
        )
                ],
              ),
            ),
          ],)
        ,),
    );
  }
}
