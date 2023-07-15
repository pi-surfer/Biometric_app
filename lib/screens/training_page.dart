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



class Kalories {
  Kalories(this.kalories, this.valueKalories);
  final String kalories;
  final dynamic valueKalories;
}

class Steps {
  Steps(this.steps, this.valueSteps);
  final String steps;
  final dynamic valueSteps;
}

class Times {
  Times(this.times, this.valueTimes);
  final String times;
  final dynamic valueTimes;
}

class day {
  // this class models the single heart rate data point
  late final DateTime date;
  late final int value;
}

class Activity extends StatefulWidget {
  static const route = '/activity/';
  static const routeDisplayName = 'Activity';

  Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  //late List<GDPData> _chartData;
  late List<Kalories> _chartData;
  late List<Steps> _chartData2;
  late List<Times> _chartData3;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    final providerChart = Provider.of<HomeProvider>(context, listen: false); 
    _chartData = getChartData(providerChart.dbTotCalories.value);
    _chartData2 = getChartData2(providerChart.dbTotSteps.value);
    _chartData3 = getChartData3(providerChart.dbAerobicTime.value);
    _tooltipBehavior = TooltipBehavior(enable: true);

    super.initState();
  }

  DateTime day = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<HomeProvider> (
                builder:(context, provider, child) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.navigate_before,
                              color: Color.fromARGB(255, 1, 97, 4),
                              size: 22,
                            ),
                            onPressed: () {
                              final provider =
                          Provider.of<HomeProvider>(context, listen: false);
                          DateTime day = provider.showDate;
                          provider
                          .getDataOfDay(day.subtract(const Duration(days: 1)));
                            }
                        ),
                        Consumer<HomeProvider>(
                        builder: (context, value, child) => Text(
                        DateFormat('dd MMMM yyyy').format(value.showDate),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 1, 97, 4),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ))),
                        IconButton(
                            icon: const Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {
                              final provider =
                          Provider.of<HomeProvider>(context, listen: false);
                      DateTime day = provider.showDate;
                      provider.getDataOfDay(day.add(const Duration(days: 1)));
                    }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: SfCircularChart(
                          annotations: <CircularChartAnnotation>[
                            CircularChartAnnotation(
                              widget: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height * 0.70,
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: SfCircularChart(
                                    annotations: <CircularChartAnnotation>[
                                      CircularChartAnnotation(
                                        widget: Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context).size.height * 0.50,
                                          width: MediaQuery.of(context).size.width * 0.50,
                                          child: SfCircularChart(
                                              palette: const <Color>[
                                                Color.fromARGB(255, 255, 221, 74)
                                              ],
                                              tooltipBehavior: _tooltipBehavior,
                                              series: <CircularSeries>[
                                                RadialBarSeries<Kalories, String>(
                                                    useSeriesColor: true,
                                                    trackOpacity: 0.2,
                                                    dataSource: _chartData,
                                                    xValueMapper:
                                                        (Kalories data, _) =>
                                                            data.kalories,
                                                    yValueMapper:
                                                        (Kalories data, _) =>
                                                            data.valueKalories,
                                                    cornerStyle:
                                                        CornerStyle.endCurve,
                                                    radius: '100%',
                                                    innerRadius: '80%',
                                                    dataLabelSettings:
                                                        const DataLabelSettings(
                                                            isVisible: false),
                                                    enableTooltip: true,
                                                    maximumValue: 5000)
                                              ]),
                                        ),
                                      )
                                    ],
                                    palette: const <Color>[
                                      Color.fromARGB(255, 253, 176, 120)
                                    ],
                                    tooltipBehavior: _tooltipBehavior,
                                    series: <CircularSeries>[
                                      RadialBarSeries<Steps, String>(
                                          useSeriesColor: true,
                                          trackOpacity: 0.2,
                                          dataSource: _chartData2,
                                          xValueMapper: (Steps data, _) =>
                                              data.steps,
                                          yValueMapper: (Steps data, _) =>
                                              data.valueSteps,
                                          cornerStyle: CornerStyle.endCurve,
                                          radius: '100%',
                                          innerRadius: '86%',
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: false),
                                          enableTooltip: true,
                                          maximumValue: 6000)
                                    ]),
                              ),
                            )
                          ],
                          palette: const <Color>[
                            Color.fromARGB(255, 255, 114, 106)
                          ],
                          tooltipBehavior: _tooltipBehavior,
                          series: <CircularSeries>[
                            RadialBarSeries<Times, String>(
                                useSeriesColor: true,
                                trackOpacity: 0.2,
                                dataSource: _chartData3,
                                xValueMapper: (Times data, _) => data.times,
                                yValueMapper: (Times data, _) => data.valueTimes,
                                cornerStyle: CornerStyle.endCurve,
                                radius: '100%',
                                innerRadius: '90%',
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: false),
                                enableTooltip: true,
                                maximumValue: 60)
                          ]),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  MdiIcons.fire,
                                  weight: 20,
                                  color: Color.fromARGB(255, 255, 221, 74),
                                ),
                                Text(
                                  'Calories',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 221, 74),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Text(
                                  (provider.dbTotCalories.value.round()).toString(),
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 221, 74),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Text(
                                  '/2000',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 221, 74),
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(children: [
                              Icon(
                                MdiIcons.walk,
                                weight: 20,
                                color: Color.fromARGB(255, 253, 176, 120),
                              ),
                              Text(
                                'Steps',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 253, 176, 120),
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                provider.dbTotSteps.value.toString(),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 253, 176, 120),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                '/6000',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 253, 176, 120),
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ]),
                            SizedBox(
                              width: 40,
                            ),
                            Column(children: [
                              Icon(
                                MdiIcons.clock,
                                weight: 20,
                                color: Color.fromARGB(255, 255, 114, 106),
                              ),
                              Text(
                                'Times',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 114, 106),
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                provider.dbAerobicTime.value.toString(),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 114, 106),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                '/60',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 114, 106),
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ]),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Today, you have earned ' + provider.dbDailyScore.value.toString() + ' points',
                      style: subtitleStyle,
                      textAlign: TextAlign.start,
                      ),
                    
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.06,
                    ),
                    
                      Text(
                        'You are still ' + (90-provider.globalScore).toString() + ' points away from funding the project:',
                        textAlign: TextAlign.start,
                      style: subtitleStyle
                      ),
                      Consumer<SelectedProject>(builder:
                        ((context, project, child) {
                          if (project.getSelectedProject() >= 0) {
                  Projects selectedProject =
                      project.proj[project.getSelectedProject()];
                          return Text(
                          selectedProject.name,
                          textAlign: TextAlign.start,
                      style: subtitleStyle
                        );} else {return Text('no project selected',textAlign: TextAlign.start,
                      style: subtitleStyle);}})
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *0.01,
                      ),
                      LinearPercentIndicator(
                      animation: true,
                      width: 360.0,
                      lineHeight: 30,
                      percent: provider.globalScore/90,
                      barRadius: Radius.circular(20),
                      backgroundColor:
                          Color.fromARGB(255, 255, 221, 74).withOpacity(0.4),
                      linearGradient: LinearGradient(colors: [
                        Color.fromARGB(255, 255, 221, 74),
                        Color.fromARGB(255, 255, 192, 74),
                      ]),
                      widgetIndicator: Container(
                          height: 60,
                          width: 60,
                          color: Colors.transparent,
                          child: Icon(Icons.star, size: 25)),
                    ),
                    SizedBox(height: 5),
                    Row(children: [
                      SizedBox(width: 25),
                      Text('SCORE: ' +
                        provider.globalScore.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        ' /90 pt',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *0.03,
                      ),
                    ]),
                  ]),
            ),
          ),
        )));
  }

  List<Kalories> getChartData(double totCal) {
    final List<Kalories> chartData = [Kalories('Kalories', totCal)];
    return chartData;
  }

  List<Steps> getChartData2(int totSteps) {
    final List<Steps> chartData2 = [Steps('Steps', totSteps)];
    return chartData2;
  }

  List<Times> getChartData3(int aeroTime) {
    final List<Times> chartData3 = [Times('Times', aeroTime)];
    return chartData3;
  }

}
