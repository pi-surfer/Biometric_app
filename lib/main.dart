import 'package:flutter/material.dart';

import 'package:app_project/screens/home_page.dart';


void main() {
  runApp(MyApp());

} // main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  } // build
} // MyApp