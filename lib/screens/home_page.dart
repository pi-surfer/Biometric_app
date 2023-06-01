import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:app_project/models/linechart_week.dart';
import 'package:app_project/models/funky_overlays.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 5, 108, 8).withOpacity(0.5),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 254, 216),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 129, 52),
                    ),
                    child: Text('My Profile'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('logout'),
                    //onTap: () => _toLoginPage(context),
                  ),
                ],
              ),
            ),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight: 60.0,
                collapsedHeight: 60,
                toolbarHeight: 60,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text(
                    'Fit2Seed',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.7,
                ),
                /*actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: const [
                      Icon(Icons.image, color: Colors.white),
                      SizedBox(
                        height: 5,
                      ),
                      Text('AppName'),
                    ], // children Column
                  ),
                ),
              ],*/
                leading: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(Icons.person),
                    iconSize: 40,
                  );
                }),
                backgroundColor: Color.fromARGB(255, 11, 96, 45),
                shadowColor: Color.fromARGB(255, 4, 47, 15), // actions AppBar
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 100, left: 20, right: 20, top: 30),
                  child: Column(children: [
                    GestureDetector(
                      onTap: (){showDialog(
                    barrierColor: const Color.fromARGB(255, 56, 56, 56).withOpacity(0.3),
                    context: context,
                    builder: (_) => FunkyOverlayYourProject(),
                  );},
                      child: Container(
                        height: 200.0,
                        width: 400.0,
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/arnie.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          /*border: Border.all(
                                width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('LoremIpsum',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            Text('The way of the bees',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('How are you doing?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: LinearPercentIndicator(
                              animation: true,
                              width: 320.0,
                              lineHeight: 30,
                              percent: 0.7,
                              barRadius: Radius.circular(20),
                              backgroundColor: Color.fromARGB(255, 255, 202, 89)
                                  .withOpacity(0.4),
                              linearGradient: LinearGradient(colors: [
                                Color.fromARGB(255, 252, 255, 89),
                                Color.fromARGB(255, 255, 208, 36)
                              ]),
                              widgetIndicator: Container(
                                  height: 55,
                                  width: 80,
                                  color: Colors.grey.withOpacity(0.3),
                                  child: Icon(Icons.run_circle, size: 25)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.transparent,
                            ),
                            //height: 300,
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            // implement the bar chart
                            child:
                                LineChartWeek(), // Grafico linea da chart1.dart
                          ),
                          Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                  'Not bad! If you will continue like this you will reach your goal within 25 days.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.3),
                          context: context,
                          builder: (_) => FunkyOverlayWeeklyProject(),
                        );
                      },
                      child: Container(
                        height: 200.0,
                        width: 400.0,
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/nike.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          /*border: Border.all(
                                width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('LoremIpsum',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            Text('The way of the bees',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.3),
                          context: context,
                          builder: (_) => FunkyOverlayWeeklyPartner(),
                        );
                      },
                      child: Container(
                        height: 200.0,
                        width: 400.0,
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/arnie.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          /*border: Border.all(
                                width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('LoremIpsum',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            Text('The way of the bees',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ])),
      ),
    );
  }
}