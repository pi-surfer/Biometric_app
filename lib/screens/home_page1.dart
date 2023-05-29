import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:app_project/models/linechart_week.dart';

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
      color: const Color.fromARGB(255, 1, 97, 4).withOpacity(0.4),
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
                  child: Column(
                    children: [
                    /*Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          /*border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('LoremIpsum',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('DESCRIZIONE'),
                              ],
                            ),
                            SizedBox(
                              width: 150.0,
                              height: 150.0,
                              child: Image.asset(
                                'assets/images/logo1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        )),*/
                    Container(
                    
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
                        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    
                    Container(
                      padding: EdgeInsets.all(10),
                      /*decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        border: Border.all(
                            width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),*/
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('How are you doing?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          const Text('SITUAZIONE ATTUALE:'),
                          LinearPercentIndicator(
                            animation: true,
                            width: 300.0,
                            lineHeight: 25,
                            percent: 0.7,
                            trailing: Icon(Icons.mood, size: 30),
                            barRadius: Radius.circular(10),
                            backgroundColor:
                                Color.fromARGB(255, 255, 200, 36)
                                    .withOpacity(0.4),
                            progressColor:
                                Color.fromARGB(255, 255, 200, 36),
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
                                  style: TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 150,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Center(child: Text('Azienda della settimana'))),
                    SizedBox(width: 10),
                    Container(
                        height: 150,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Center(child: Text('Progetto della settimana'))),
                  ]),
                ),
              ),
            ])),
      ),
    );
  }
}
