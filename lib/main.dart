import 'package:app_project/models/projects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_project/screens/splash.dart';
import 'package:app_project/services/impact.dart';
import 'package:app_project/models/missions.dart';
import 'package:app_project/utils/shared_preferences.dart';

// VERSION 1.2

void main() {
  runApp(MyApp());
} // main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => Preferences()..init(),
            lazy: false,
          ),
          Provider(
              create: (context) => ImpactService(
                    Provider.of<Preferences>(context, listen: false),
                  )),
          ChangeNotifierProvider<Missions>(
              child: MyApp(), create: (_) => Missions()),
          ChangeNotifierProvider<SelectedProject>(
            child: MyApp(), create: (_) => SelectedProject()
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Poppins'),
          home: const Splash(),
        ));
  } // build
} // MyApp