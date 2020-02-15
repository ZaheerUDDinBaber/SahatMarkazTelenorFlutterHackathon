import 'package:flutter/material.dart';
import 'package:sahat_markaz/components/appbar.dart';
import 'package:sahat_markaz/components/conts.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/child_immunization_program_page.dart';
class lady_health_worker_landing_page extends StatefulWidget {
  @override
  _lady_health_worker_landing_pageState createState() => _lady_health_worker_landing_pageState();
}

class _lady_health_worker_landing_pageState extends State<lady_health_worker_landing_page> {
  @override

  Widget build(BuildContext context) {
    set_pageName("Lady Health Worker");
    return Scaffold(
      appBar:PreferredSize(child: myappbar(), preferredSize: Size(35.0,60.0)),
      body:
      Card(
        child:
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => child_immunization_program_page()),);
          }, child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset('assets/icons/immunization.png',width: 120,height: 120,),
            Text("Child Immunization      ",style: TextStyle(fontWeight: FontWeight.bold))
          ],),),
      ),
    );
  }
}
