import 'package:app_project/screens/login/signup_page.dart';
import 'package:flutter/material.dart';

import 'package:app_project/screens/login/login_page.dart';


void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp()
    );
  } // build
} // MyApp