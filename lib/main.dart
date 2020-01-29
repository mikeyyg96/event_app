import 'package:event_app/ui/views/loginPages/frame_login_view.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFAF9164),
        accentColor: Color(0xFFF7F3E3),
        fontFamily: 'Geosans'
      ),
      home: FrameLoginView(),
    );
  }
}