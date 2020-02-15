import 'package:flutter/material.dart';
import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:sahat_markaz/ModuleBirthCenterPages/new_child_birth_form_page.dart';

class birth_center_landing_page extends StatefulWidget {
  @override
  _birth_center_landing_pageState createState() => _birth_center_landing_pageState();
}

class _birth_center_landing_pageState extends State<birth_center_landing_page> {
  @override

  Widget build(BuildContext context) {
    set_pageName("Child Birth Center");
    return Scaffold(
      appBar:PreferredSize(child: myappbar(), preferredSize: Size(35.0,60.0)),
      body:
            Card(
              child:
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new_child_birth_form_page()),);

                }, child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset('assets/icons/newbaby.png',width: 120,height: 120,),
                  Text(" Enter New Child Record ",style: TextStyle(fontWeight: FontWeight.bold))
                ],),),
            ),
    );
  }
}
