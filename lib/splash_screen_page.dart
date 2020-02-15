import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sahat_markaz/landing_page.dart';
import 'package:sahat_markaz/no_interrnet_page.dart';
import 'package:connectivity/connectivity.dart';

class splash_screen extends StatefulWidget {
  @override
  bool internet_connection;
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<splash_screen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      check_connection().then((connection_status){
        if(connection_status != null && connection_status == true){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => landing_page()));
        }else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => no_internet_page()));
        }
      });
    }
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/project_cover.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Future<bool> check_connection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

