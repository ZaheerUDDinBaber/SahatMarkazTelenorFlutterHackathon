import 'package:flutter/material.dart';
import 'package:sahat_markaz/splash_screen_page.dart';
import 'package:sahat_markaz/ModuleBirthCenterPages/birth_center_landing_page.dart';

void main() {
  runApp(
      MaterialApp(
          routes: <String, WidgetBuilder> {
            '/birth_center_landing': (BuildContext context) => new birth_center_landing_page(),
          },
          debugShowCheckedModeBanner: false,
          home: splash_screen()
      )
  );
}