import 'package:flutter/material.dart';
import 'package:sahat_markaz/ModuleBirthCenterPages/birth_center_landing_page.dart';
import 'package:sahat_markaz/ModuleReports/reports_landing_page.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/lady_health_worker_landing_page.dart';
import 'package:sahat_markaz/ModuleReports/reports_data_pull.dart';

class landing_page extends StatefulWidget {
  @override
  _landing_pageState createState() => _landing_pageState();
}

class _landing_pageState extends State<landing_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child:Text('صحت مرکز', style: TextStyle(color: Color(0xFFFF8F00), fontWeight: FontWeight.bold),),),backgroundColor: Colors.white, ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 3.0,
            backgroundColor: Colors.white,
            expandedHeight: 240.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/project_cover.png', fit: BoxFit.fitHeight,),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  child:
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => birth_center_landing_page()),);
                    }, child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset('assets/icons/birthplace.jpg',width: 120,height: 120, fit: BoxFit.fitWidth,),
                      Text(" Child Birth Center   ",style: TextStyle(fontWeight: FontWeight.bold))
                    ],),),
                ),
                Card(
                  child:
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => lady_health_worker_landing_page()),);

                    }, child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset('assets/icons/female.png',width: 120,height: 120, fit: BoxFit.fitWidth,),
                      Text(" Lady Health Worker   ",style: TextStyle(fontWeight: FontWeight.bold))
                    ],),),
                ),
                Card(
                  child:
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => reports_and_data()),);
                    }, child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset('assets/icons/reports.png',width: 120,height: 120,fit: BoxFit.fitWidth),
                      Text(" Reports    ",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}








