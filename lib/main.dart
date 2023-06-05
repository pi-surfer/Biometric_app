import 'package:flutter/material.dart';

import 'package:app_project/screens/profile_page.dart';


void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage()
    );
  } // build
} // MyApp