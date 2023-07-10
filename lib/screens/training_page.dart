import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//import 'package:app_project/widgets/date_widget.dart';
import 'package:app_project/widgets/date_picker_widget.dart';
import 'package:app_project/provider/all_providers.dart';
import 'package:app_project/models/db.dart';
//import 'package:app_project/gestures/tap.dart';

//import 'package:progetto/widgets/custom_plot.dart';

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final dynamic gdp;
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

  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late List<finalOBIETTIVI> _chartData1;

  @override
  void initState() {
    _chartData = getChartData();
    _chartData1 = getChartData1();
    _tooltipBehavior = TooltipBehavior(enable: true);

    super.initState();
  }

  DateTime day = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 228),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 90,
                  controller: _controller,
                  //startDate: DateTime.now(),
                  selectionColor: Color.fromARGB(100, 1, 97, 4),
                  selectedTextColor: Color.fromARGB(255, 254, 251, 228),
                  /*inactiveDates: [
                  DateTime.now().add(Duration(days: 1)),
                  DateTime.now().add(Duration(days: 2)),
                  DateTime.now().add(Duration(days: 3)),
                  DateTime.now().add(Duration(days: 4)),
                  DateTime.now().add(Duration(days: 5)),
                  DateTime.now().add(Duration(days: 6)),
                  DateTime.now().add(Duration(days: 7))
                ],*/
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),*/

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
                IconButton(
                  icon: const Icon(Icons.navigate_before, color: Color.fromARGB(255, 1, 97, 4),size:20,),
                  onPressed: () {
                    final provider =
                          Provider.of<HomeProvider>(context, listen: false);
                      DateTime day = provider.showDate;
                      provider
                          .getDataOfDay(day.subtract(const Duration(days: 1)));
                    }),
                    Consumer<HomeProvider>(
                    builder: (context, value, child) => Text(
                        DateFormat('dd MMMM yyyy').format(value.showDate), style: const TextStyle(
                        color: Color.fromARGB(255, 1, 97, 4),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        )
                      ),),
                    IconButton(
                      icon: const Icon(Icons.navigate_next, color: Color.fromARGB(255, 1, 97, 4),size: 20, ),
                      onPressed: () {
                        final provider =
                          Provider.of<HomeProvider>(context, listen: false);
                      DateTime day = provider.showDate;
                      provider.getDataOfDay(day.add(const Duration(days: 1)));
                    }),

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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 400,
                width: 400,
                child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                            child: const Text(
                          'Text',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Color.fromARGB(255, 1, 97, 4)),
                        )),
                      )
                    ],
                    palette: const <Color>[
                      Color.fromARGB(255, 255, 114, 106),
                      Color.fromARGB(255, 255, 221, 74),
                      Color.fromARGB(255, 253, 176, 120)
                    ],
                    legend: Legend(
                      isVisible: true,
                      //textStyle: TextStyle(
                      //fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),

                      position: LegendPosition.bottom,
                      alignment: ChartAlignment.center,
                      overflowMode: LegendItemOverflowMode.wrap,
                      legendItemBuilder: (String name, dynamic series,
                          dynamic point, int index) {
                        return Container(
                          height: 75,
                          width: 98,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins')),
                              Text(point.y.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins')),
                              Text('/1000',
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: 'Poppins')),
                            ],
                          ),

                          //Icon(point.MdiIcons.fire),
                          //Icon(point.MdiIcons.walk),
                          //Icon(point.MdiIcons.clock),
                        );
                      },
                    ),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      RadialBarSeries<GDPData, String>(
                          useSeriesColor: true,
                          trackOpacity: 0.2,
                          dataSource: _chartData,
                          xValueMapper: (GDPData data, _) => data.continent,
                          yValueMapper: (GDPData data, _) => data.gdp,
                          cornerStyle: CornerStyle.endCurve,
                          radius: '90%',
                          gap: '6%',
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                          enableTooltip: true,
                          maximumValue: 1000)
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
                height: 20,
              ),

              /*Container(
                    alignment: Alignment.center,
                    height: 350,
                    width: 350,
                    child: SfCircularChart(
                      palette: [Color.fromARGB(255, 253, 176, 120), Color.fromARGB(255, 255, 114, 106), Color.fromARGB(255, 255, 221, 74),],
                    
                    //textStyle: const TextStyle(fontSize: 13)),
                    //tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                      RadialBarSeries<finalOBIETTIVI,String>(
                      pointColorMapper: (finalOBIETTIVI,_) => const Color.fromARGB(255, 10, 159, 12),
                      dataSource: _chartData1,
                      useSeriesColor: true,
                      trackOpacity: 0.2,
                      
                      xValueMapper: (finalOBIETTIVI value,_) => value.crediti,
                      yValueMapper: (finalOBIETTIVI value,_) => value.value,
                      cornerStyle: CornerStyle.endCurve,
                      radius:'100%',
                      gap:'4%',
                      dataLabelSettings: const DataLabelSettings(isVisible: false),
                      enableTooltip: true,
                      maximumValue: 300,
                      
                    )
                  ] 
                  ),

                  ),*/

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
              Row(
                children: [
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
                    textAlign: TextAlign.start,
                  ),
                ],
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
            ],
          ),
        ]),
      ),
    ));

    /*    bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255,255,255,255),
              fixedColor:  const Color.fromARGB(255, 6, 95, 9),
              items: navBarItems,
              //currentIndex: _selIdx,
              //onTap: _onItemTapped,
                  ),*/
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Kalories', 100),
      GDPData('Time', 60),
      GDPData('Steps', 8645)
    ];
    return chartData;
  }

  List<finalOBIETTIVI> getChartData1() {
    final List<finalOBIETTIVI> chartData1 = [
      finalOBIETTIVI('Crediti', 180),
    ];
    return chartData1;
  }
} //build
 //Page


 