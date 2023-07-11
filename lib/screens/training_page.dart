//import 'package:app_project/widgets/date_widget.dart';
import 'package:app_project/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';


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

class finalOBIETTIVI {
  finalOBIETTIVI(this.crediti, this.value);
  final String crediti;
  final double value;
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
  late List<finalOBIETTIVI> _chartData1;

  @override
  void initState() {
    _chartData = getChartData();
    _chartData1 = getChartData1();
    _chartData2 = getChartData2();
    _chartData3 = getChartData3();
    _tooltipBehavior = TooltipBehavior(enable: true);

    super.initState();
  }

  DateTime day = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            setState(() {
                              day = day.subtract(const Duration(days: 1));
                            });
                          }),
                      Text(DateFormat('dd MM yyyy').format(day),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 1, 97, 4),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                          )),
                      IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Color.fromARGB(255, 1, 97, 4),
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              day = day.add(const Duration(days: 1));
                            });
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(MdiIcons.reload,
                          size: 18, color: Color.fromARGB(255, 254, 251, 228)),
                      label: const Text(
                        "Update your data",
                        style: TextStyle(
                            color: Color.fromARGB(255, 254, 251, 228),
                            fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28.0),
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(255, 1, 97, 4),
                      )),
                  Container(
                    alignment: Alignment.center,
                    height: 500,
                    width: 500,
                    child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                            widget: Container(
                              alignment: Alignment.center,
                              height: 300,
                              width: 300,
                              child: SfCircularChart(
                                  annotations: <CircularChartAnnotation>[
                                    CircularChartAnnotation(
                                      widget: Container(
                                        alignment: Alignment.center,
                                        height: 200,
                                        width: 200,
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
                                                  maximumValue: 1000)
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
                                        innerRadius: '85%',
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: false),
                                        enableTooltip: true,
                                        maximumValue: 1000)
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
                              maximumValue: 1000)
                        ]),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Row(
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
                                'Kalories',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 221, 74),
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              Text(
                                '100',
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
                              '2500',
                              style: TextStyle(
                                color: Color.fromARGB(255, 253, 176, 120),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              '/10000',
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
                              '20',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 114, 106),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              '/180',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 114, 106),
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ]),
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Oggi hai guadagnato N crediti',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 97, 4),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    child: SfCircularChart(

                        //textStyle: const TextStyle(fontSize: 13)),
                        //tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          RadialBarSeries<finalOBIETTIVI, String>(
                            pointColorMapper: (finalOBIETTIVI, _) =>
                                const Color.fromARGB(255, 10, 159, 12),
                            dataSource: _chartData1,
                            useSeriesColor: true,
                            trackOpacity: 0.2,
                            xValueMapper: (finalOBIETTIVI value, _) =>
                                value.crediti,
                            yValueMapper: (finalOBIETTIVI value, _) =>
                                value.value,
                            cornerStyle: CornerStyle.endCurve,
                            radius: '100%',
                            innerRadius: '80%',
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false),
                            enableTooltip: true,
                            maximumValue: 300,
                          )
                        ]),
                  ),
                  LinearPercentIndicator(
                    animation: true,
                    width: 360.0,
                    lineHeight: 30,
                    percent: 0.7,
                    barRadius: Radius.circular(20),
                    backgroundColor:
                        Color.fromARGB(255, 255, 221, 74).withOpacity(0.6),
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
                    Text(
                      '65 pt',
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'ti mancano ancora X punti per finanziare',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 95, 9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const Text(
                      'LE API DI DARIO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 95, 9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ]),
          ),
        )));
  }

  List<Kalories> getChartData() {
    final List<Kalories> chartData = [Kalories('Kalories', 100)];
    return chartData;
  }

  List<Steps> getChartData2() {
    final List<Steps> chartData2 = [Steps('Steps', 2000)];
    return chartData2;
  }

  List<Times> getChartData3() {
    final List<Times> chartData3 = [Times('Times', 100)];
    return chartData3;
  }

  List<finalOBIETTIVI> getChartData1() {
    final List<finalOBIETTIVI> chartData1 = [finalOBIETTIVI('Crediti', 180)];
    return chartData1;
  }
}
