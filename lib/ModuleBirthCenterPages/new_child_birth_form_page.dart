import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:sahat_markaz/ModuleBirthCenterPages/birth_center_landing_page.dart';
import 'package:sahat_markaz/components/data_push.dart';
import 'package:sahat_markaz/components/models/model_child_birth.dart';

class new_child_birth_form_page extends StatefulWidget {
  @override
  _new_child_birth_form_pageState createState() => _new_child_birth_form_pageState();
}

class _new_child_birth_form_pageState extends State<new_child_birth_form_page> {

  // child controllers//
  String child_sex = "";
  TextEditingController child_weight = new TextEditingController();
  TextEditingController child_height = new TextEditingController();
  String child_delivery_date = "";
  String child_delivery_time = "";
  //parents information controllers//
  TextEditingController parent_father_name = new TextEditingController();
  TextEditingController parent_father_cnic_five = new TextEditingController();
  TextEditingController parent_father_cnic_seven = new TextEditingController();
  TextEditingController parent_father_cnic_one = new TextEditingController();
  TextEditingController parent_mother_name = new TextEditingController();
  TextEditingController parent_mother_cnic_five = new TextEditingController();
  TextEditingController parent_mother_cnic_seven = new TextEditingController();
  TextEditingController parent_mother_cnic_one = new TextEditingController();
  TextEditingController parent_address = new TextEditingController();
  TextEditingController parent_contact_number = new TextEditingController();
  //city information controllers//
  TextEditingController hospital_name = new TextEditingController();
  var hospital_city;
  bool verify_data_value = false;

  @override
  Widget build(BuildContext context) {
    set_pageName("New Child Data Form");
    return Container(
      child:Scaffold(
          appBar:PreferredSize(child: myappbar(), preferredSize: Size(35.0,60.0)),
          body:SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 3.0,
                          color: Color(0xFFFF8F00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("New Born Information", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                margin: const EdgeInsets.all(5.0),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("    Child Sex ", style: TextStyle(color: Colors.white),),
                                  Text("        Male",style: TextStyle(color: Colors.white)),
                                  Radio(
                                    value: "Male",
                                    groupValue: child_sex,
                                    onChanged: (sex){
                                      setState(() {
                                        child_sex = sex;

                                      });
                                    },
                                  ),
                                  Text("   Female",style: TextStyle(color: Colors.white)),
                                  Radio(
                                    value: "Female",
                                    groupValue: child_sex,
                                    onChanged: (sex){
                                      setState(() {
                                        child_sex = sex;

                                      });

                                    },
                                  ),
                                  Text("   Other",style: TextStyle(color: Colors.white)),
                                  Radio(
                                    value: "Other",
                                    groupValue: child_sex,
                                    onChanged: (sex){
                                      setState(() {
                                        child_sex = sex;

                                      });

                                    },
                                  )
                                ],
                              ),
                              // child weight //
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child:TextField(
                                      controller: child_weight,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.white)),
                                        hintText: 'Enter Weight of Child',
                                        labelText: 'Weight in Kgs',
                                        labelStyle: TextStyle(color: Colors.white),
                                        hintStyle: TextStyle(color: Colors.white),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        WhitelistingTextInputFormatter.digitsOnly
                                      ],
                                    ),),
                                  Text("            Kgs         ", style: TextStyle(color: Colors.white),),
                                ],
                              ),

                              // child length //
                              Row(
                                children: <Widget>[
                                  Flexible(child:TextField(
                                    controller: child_height,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                          borderSide: new BorderSide(color: Colors.white)),
                                      hintText: 'Enter Height of Child',
                                      labelText: 'Height in Centi Meters',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                  ),),
                                  Text("   Centi Meters  ", style: TextStyle(color: Colors.white),),
                                ],
                              ),

                              // date of birth //
                              Row(children: <Widget>[
                                Text("   Birth Date       ",style: TextStyle(color: Colors.white)),
                                RaisedButton(
                                    child:
                                    Text("Pick Date"),
                                    onPressed: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2025)
                                      ).then((onValue) {
                                        setState(() {
                                          child_delivery_date = onValue.day.toString()+"-"+onValue.month.toString()+"-"+onValue.year.toString();
                                        });
                                      });
                                    }),
                                Text("          "+child_delivery_date,style: TextStyle(color: Colors.white)),
                              ],
                              ),
                              Row(children: <Widget>[
                                Text("   Birth Time      ",style: TextStyle(color: Colors.white)),
                                RaisedButton(
                                    child:
                                    Text("Pick Time"),
                                    onPressed: () {
                                      showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now()
                                      ).then((onValue) {
                                        setState(() {
                                          child_delivery_time = onValue.hour.toString()+":"+onValue.minute.toString();
                                        });
                                      });
                                    }),
                                Text("          "+child_delivery_time,style: TextStyle(color: Colors.white)),
                              ],
                              ),
                            ],
                          ),
                        ),
                        // parents information section //
                        // parents card//
                        Card(
                          elevation: 50.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xFFFF8F00),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text("Parents Information", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                margin: const EdgeInsets.all(5.0),
                              ),
                              // father card
                              Card(
                                elevation: 5.0,
                                color: Colors.orange,
                                child: Column(
                                  children: <Widget>[
                                    TextField(
                                      controller: parent_father_name,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.white)),
                                        hintText: 'Please Child Father Name',
                                        labelText: 'Father Name',
                                        labelStyle: TextStyle(color: Colors.white),
                                        hintStyle: TextStyle(color: Colors.white),
                                      ),),
                                    Row(
                                      children: <Widget>[
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
                                              hintStyle: TextStyle(color: Colors.white),
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
                                              hintStyle: TextStyle(color: Colors.white),
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
                                              hintStyle: TextStyle(color: Colors.white),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              WhitelistingTextInputFormatter.digitsOnly
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // MOTHER INFORMATION//
                              // Mother Card //
                              Card(
                                elevation: 5.0,
                                color: Colors.orange,
                                child:Column(
                                  children: <Widget>[
                                    TextField(
                                      controller: parent_mother_name,
                                      textAlign: TextAlign.left,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(color: Colors.white)),
                                        hintText: 'Please Child Mother Name',
                                        labelText: 'Mother Name',
                                        labelStyle: TextStyle(color: Colors.white),
                                        hintStyle: TextStyle(color: Colors.white),
                                      ),),
                                    Row(
                                      children: <Widget>[
                                        new Flexible(
                                          child: new
                                          TextField(
                                            controller: parent_mother_cnic_five,
                                            textAlign: TextAlign.left,
                                            maxLength: 5,
                                            decoration: InputDecoration(
                                              border: new OutlineInputBorder(
                                                  borderSide: new BorderSide(color: Colors.teal)),
                                              hintText: 'XXXXX',
                                              hintStyle: TextStyle(color: Colors.white),
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
                                              hintStyle: TextStyle(color: Colors.white),
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
                                              hintStyle: TextStyle(color: Colors.white),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              WhitelistingTextInputFormatter.digitsOnly
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),),
                              TextField(
                                controller: parent_address,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white)),
                                  hintText: 'Please Enter Parents Address',
                                  labelText: 'Parents Address',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),),
                              TextField(
                                controller: parent_contact_number,
                                textAlign: TextAlign.left,
                                maxLength: 14,
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white)),
                                  labelText: "Phone Number",
                                  hintText: '03XXXXXXXXX | +92XXXXXXXXX',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                              )
                            ],
                          ),
                        ),
                        Card(
                          elevation: 3.0,
                          color: Color(0xFFFF8F00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child:Column(
                            children: <Widget>[
                              Container(
                                child: Text("Hospital Information", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                margin: const EdgeInsets.all(5.0),
                              ),
                              TextField(
                                controller: hospital_name,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white)),
                                  hintText: 'Please Enter Hospital Name',
                                  labelText: 'Hospital Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),),
                              Row(children: <Widget>[
                                Text("    City               ", style: TextStyle(color: Colors.white),),
                                DropdownButton<String>(
                                  value: hospital_city,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 28,
                                  elevation: 20,
                                  onChanged: (String newval){
                                    setState((){
                                      hospital_city = newval;
                                      print(hospital_city);
                                    });

                                  },
                                  items: <String>["Lahore"]
                                      .map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],),

                            ],
                          ) ,
                        ),
                        Divider(height: 30.0,),
                        Row(children: <Widget>[
                          Text("    Verify Information ", style: TextStyle(fontWeight: FontWeight.bold),),
                          Checkbox(
                            value: verify_data_value,
                            onChanged: (bool value){
                              setState(() {
                                verify_data_value = value;
                              });
                            },
                          ),
                          button(),
                        ],)
                      ])))
      ) ,
    );
  }

  Widget button(){
    if (verify_data_value == true){
      return RaisedButton(
          color: Colors.green,
          onPressed:(){
            // getting ready model with data from fields//
            String Father_CNIC = parent_father_cnic_five.text + parent_father_cnic_seven.text + parent_father_cnic_one.text;
            String Mother_CNIC = parent_mother_cnic_five.text + parent_mother_cnic_seven.text + parent_mother_cnic_one.text;

            child_model childFormModelObject = new
            child_model(child_sex, child_weight.text, child_height.text, child_delivery_date,
                child_delivery_time, parent_father_name.text, Father_CNIC, parent_mother_name.text,
                Mother_CNIC, parent_address.value.text, parent_contact_number.text, hospital_name.text,
                hospital_city);
            data_push_to_cloud(childFormModelObject);
            // defined in data_push file from components
            AlertDialog alert = AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                title: Text('Saving Data To Cloud'),
                content: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    new CircularProgressIndicator(),
                    new Text("                      Saving"),
                  ],));
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );

            saving_wait();

          },
          child: Text('       Submit       ', style: TextStyle(color: Colors.white),)
      );
    }else{
      return RaisedButton(
          onPressed:null,
          child:Text('Check Verify Box')
      );
    }
  }

  void saving_wait () async{
    await Future.delayed(new Duration(seconds: 2));
    Navigator.pop(context,true);
    Navigator.pop(context,true);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => birth_center_landing_page()));
  }
}

