import 'package:flutter/material.dart';

import 'package:app_project/screens/reward_page.dart';


void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RewardPage()
    );
  } // build
} // MyApp