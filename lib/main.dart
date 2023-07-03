import 'package:app_project/models/missions.dart';
import 'package:flutter/material.dart';

import 'package:app_project/screens/reward_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider<Missions>(
    child: MyApp(),
    create: (_) => Missions()));

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