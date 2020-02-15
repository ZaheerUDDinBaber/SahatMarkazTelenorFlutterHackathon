import 'dart:async';
import 'package:flutter/material.dart';
class no_internet_page extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}
class _NoInternetState extends State<no_internet_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/no_internet.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
