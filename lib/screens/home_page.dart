import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:app_project/models/linechart_week.dart';
import 'package:app_project/models/funky_overlays.dart';
import 'package:app_project/models/text_styles.dart';

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
      color: Color.fromARGB(255, 5, 108, 8).withOpacity(0.6),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 251, 249, 226),
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
                      bottom: 100, left: 20, right: 20, top: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width:230,
                          child: Column(
                            children: [
                              Text(
                                  'Thank you, Massimo!',
                                  style: titleStyle,
                                  textAlign: TextAlign.start,),
                              SizedBox(height: 5,),
                              Text(
                                  'Together we are achieving great results.',
                                  style: subtitleStyle,
                                  textAlign: TextAlign.start,),
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/well_done.png'),
                            fit: BoxFit.cover,
                          ),),),],
                    ),
                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: (){showDialog(
                    barrierColor: const Color.fromARGB(255, 56, 56, 56).withOpacity(0.3),
                    context: context,
                    builder: (_) => FunkyOverlay(
                      mainImage: AssetImage('assets/images/arnie.png'),
                      title: 'Le api di Dario',
                      subtitle: 'The way of the bees',
                      body: 'prova',
                      isSelected: true,
                      ),
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
                            SizedBox(height: 15)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width:25),
                            Text('Your Progress',
                                style: titleStyle,
                                textAlign: TextAlign.start,),
                          ],
                        ),
                        SizedBox(height:15),
                        LinearPercentIndicator(
                          animation: true,
                          width: 360.0,
                          lineHeight: 30,
                          percent: 0.7,
                          barRadius: Radius.circular(20),
                          backgroundColor: Color.fromARGB(255, 255, 221, 74)
                              .withOpacity(0.6),
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
                            Text('65 pt',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(' /90 pt',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
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
                            child: Column(
                              children: [
                                Text(
                                    'Not bad! \nIf you will continue like this you will reach your goal within: 15 days',
                                    textAlign: TextAlign.start,
                                    style: bodyStyle),
                              ],
                            ),
                    ),],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                          children: [
                            SizedBox(width:25),
                            Text('Take a look at this!',
                                style: titleStyle,
                                textAlign: TextAlign.start,),
                          ],
                        ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.3),
                          context: context,
                          builder: (_) => FunkyOverlay(
                            mainImage: AssetImage('assets/images/marathon.png'),
                            title: 'Nike',
                            subtitle: 'Make it happens',
                            body: 'Maratona',
                            isSelectable: false,
                          ),
                        );
                      },
                      child: Container(
                        height: 200.0,
                        width: 400.0,
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/marathon.png'),
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
                          builder: (_) => FunkyOverlay(
                             mainImage: AssetImage('assets/images/garden.png'),
                            title: 'Beautiful Garden',
                            subtitle: 'Bio for life',
                            body: 'Maratona',
                          ),
                        );
                      },
                      child: Container(
                        height: 200.0,
                        width: 400.0,
                        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/garden.png'),
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