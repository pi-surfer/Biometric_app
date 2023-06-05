import 'package:app_project/screens/partner_page.dart';
import 'package:flutter/material.dart';
import 'package:app_project/screens/slpash.dart';



void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Partner()
    );
  } // build
} // MyApp