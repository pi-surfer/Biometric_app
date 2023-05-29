import 'package:app_project/screens/skeleton_page.dart';

import 'package:app_project/screens/training_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Activity(),
      );
  } // build
} // MyApp 