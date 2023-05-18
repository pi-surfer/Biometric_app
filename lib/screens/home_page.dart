import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:app_project/screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: null,
                    border: Border.all(
                        width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Progetto finanziato'),
                          SizedBox(
                            height: 20,
                          ),
                          Text('DESCRIZIONE'),
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          color: Color.fromARGB(255, 151, 157, 162),
                          height: 100,
                          width: 100),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 270,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: null,
                  border: Border.all(
                      width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('SITUAZIONE ATTUALE:'),
                        LinearPercentIndicator(
                          animation: true,
                          width: 300.0,
                          lineHeight: 25,
                          percent: 0.7,
                          trailing: Icon(Icons.mood, size: 30),
                          barRadius: Radius.circular(10),
                          backgroundColor: Color.fromARGB(255, 209, 160, 160),
                          progressColor: Color.fromARGB(255, 221, 31, 31),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding( 
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 40),
            child: Column(
              children: [Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: null,
              border:
                  Border.all(width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(30),
              // implement the bar chart
              child: BarChart(
                BarChartData(
                    borderData: FlBorderData(
                        border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )),
                    groupsSpace: 10,

                    // add bars
                    barGroups: [
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 3, width: 15, color: Colors.amber),
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 1, width: 15, color: Colors.amber),
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(toY: 2, width: 15, color: Colors.amber),
                      ]),
                    ]),
              ),
            ),
          ),Column(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: null,
                        border: Border.all(
                            width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(child: Text('Azienda della settimana'))),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                      height: 150,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: null,
                        border: Border.all(
                            width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(child: Text('Progetto della settimana'))),
                ),
              ],
            ),
          ]),
       ]),
      ),
      ),
    ]),
    );
  }

  void _toLoginPage(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  } // _toLoginPage
}
