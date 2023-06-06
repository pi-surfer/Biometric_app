import 'package:flutter/material.dart';

import 'package:app_project/screens/skeleton_page.dart';


void main() {
  runApp(MyApp());

} // main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: SkeletonPage(),
    );
  } // build
} // MyApp 