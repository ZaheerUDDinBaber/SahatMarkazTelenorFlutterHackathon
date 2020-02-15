////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:sahat_markaz/components/conts.dart';
////////////////////////////////////////////////////////////////////////////////

class myappbar extends StatefulWidget {
  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<myappbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0, // shadow
      backgroundColor: Color(0xFFFF8F00),
      title: Text(pageName),
      // pagename defined in conts//
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context,true);
            setState(() {
              // refresh state
            });
          }
      ),
    );
  }
}

