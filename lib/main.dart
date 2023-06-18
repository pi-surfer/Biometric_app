import 'package:app_project/models/projects.dart';
import 'package:app_project/provider/projects_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_project/screens/projects_page.dart';


void main() {
  runApp(const MyApp());

} // main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProjectProvider> (
      create: (context) => ProjectProvider(),
      child: const MaterialApp(
      home: ProjectPage()
    )
    );
  } // build
} // MyApp