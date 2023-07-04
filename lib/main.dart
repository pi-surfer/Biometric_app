import 'package:app_project/models/missions.dart';
import 'package:flutter/material.dart';

import 'package:app_project/screens/skeleton_page.dart';
import 'package:provider/provider.dart';

// VERSION 1

void main() {
  runApp(ChangeNotifierProvider<Missions>(
    child: MyApp(),
    create: (_) => Missions()));

} // main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SkeletonPage(),
    );
  } // build
} // MyApp