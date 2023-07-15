import 'package:app_project/models/projects.dart';
import 'package:app_project/models/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:app_project/widgets/date_picker_widget.dart';
import 'package:app_project/provider/home_provider.dart';
import 'package:app_project/database/db.dart' as db;

class Prova extends StatefulWidget {
  static const route = '/activity/';
  static const routeDisplayName = 'Activity';

  Prova({Key? key}) : super(key: key);

  @override
  State<Prova> createState() => _ProvaState();
}

class _ProvaState extends State<Prova> {
  DateTime day = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        body: SafeArea(
            child: Consumer<HomeProvider>(
                builder: (context, hp, child) =>
                   Column(
                     children: [
                       Text(hp.totalSteps.toString()),
                       Text(hp.lastFetch.toString()),
                       Text(hp.aerobicTime.toString()),
                     ],
                   ),
                   )));
  }
}
