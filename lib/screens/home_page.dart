import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:app_project/widgets/linechart_week.dart';
import 'package:app_project/models/funky_overlays.dart';
import 'package:app_project/models/text_styles.dart';
import 'package:app_project/provider/home_provider.dart';
//import 'package:app_project/models/db.dart' as db;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 249, 226),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 100, left: 20, right: 20, top: 30),
              child: Consumer<HomeProvider> (
                builder:(context, provider, child) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width * 0.53,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Thank you, Massimo!!',
                                style: titleStyle,
                                textAlign: TextAlign.start,),
                            SizedBox(height: 5,),
                            Text(
                                'It is nice working together for an healtier planet',
                                style: subtitleStyle,
                                textAlign: TextAlign.start,),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.27,
                        width: MediaQuery.of(context).size.width * 0.27,
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
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
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
                          Text('Le api di Dario',
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
                          Text('0',
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
                                /// qui cambiamo con punteggio perchè non facciamo i giorni
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
          ),
        ]));
  }
}