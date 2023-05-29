import 'package:flutter/material.dart';

import 'package:app_project/screens/home_page1.dart';


void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  } // build
} // MyApp