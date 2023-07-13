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
        backgroundColor: const Color.fromARGB(255, 251, 249, 226),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 100, left: 8, right: 8, top: 30),
              child: 
              //Consumer<HomeProvider> (
                //builder:(context, provider, child) => 
                Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width * 0.43,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Thank you, Massimo!!',
                                style: titleStyle,
                                textAlign: TextAlign.start,),
                            SizedBox(height: 2,),
                            Text(
                                'It is nice working together for an healtier planet',
                                style: subtitleStyle,
                                textAlign: TextAlign.start,),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.002),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.30,
                        width: MediaQuery.of(context).size.width * 0.30,
                        decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/well_done.png'),
                          fit: BoxFit.cover,
                        ),),),],
                  ),
                  const SizedBox(height: 25,),
                  GestureDetector(
                    onTap: (){showDialog(
                  barrierColor: const Color.fromARGB(255, 56, 56, 56).withOpacity(0.3),
                  context: context,
                  builder: (_) => const FunkyOverlay(
                    mainImage: AssetImage('assets/images/arnie.png'),
                    title: 'Le api di Dario',
                    subtitle: 'The way of the bees',
                    body: 'prova',
                    isSelected: true,
                    ),
                );},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.95,
                      //margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/arnie.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                        color: Color.fromARGB(255, 251, 249, 226),
                        /*border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.bottomLeft,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('  Le api di Dario',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 226),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 28,
                                /*background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,*/
                              )),
                          Text('  The way of the bees',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 226),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                /*background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,*/
                              )),
                          SizedBox(height: 15)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width:25),
                          Text('Your Progress',
                              style: titleStyle,
                              textAlign: TextAlign.start,),
                        ],
                      ),
                      const SizedBox(height:15),
                      LinearPercentIndicator(
                        animation: true,
                        width: 360.0,
                        lineHeight: 30,
                        percent: 0.7,
                        barRadius: Radius.circular(20),
                        backgroundColor: Color.fromARGB(100, 255, 221, 74)
                            .withOpacity(0.6),
                        linearGradient: LinearGradient(colors: [
                          Color.fromARGB(100, 255, 221, 74),
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
                          Text('SCORE',
                          //${provider.score}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Poppins',
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
                      const SizedBox(height: 25,),
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
                          padding: EdgeInsets.all(15),
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
                  const SizedBox(height: 20,),
                  Row(
                        children: [
                          SizedBox(width:25),
                          Text('Take a look at this!',
                              style: titleStyle,
                              textAlign: TextAlign.start,),
                        ],
                      ),

                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        /*barrierColor: const Color.fromARGB(255, 56, 56, 56)
                            .withOpacity(0.3),*/
                        context: context,
                        builder: (_) => const FunkyOverlay(
                          mainImage: AssetImage('assets/images/marathon.png'),
                          title: 'Nike',
                          subtitle: 'Make it happens',
                          body: 'Maratona',
                          isSelectable: false,
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.95,
                      //margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/marathon.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        /*border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.bottomLeft,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('  LoremIpsum',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 226),
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                /*background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,*/
                              )),
                          Text('   The way of the bees',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 226),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                /*background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,*/
                              )),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height : 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        /*barrierColor: const Color.fromARGB(255, 56, 56, 56)
                            .withOpacity(0.3),*/
                        context: context,
                        builder: (_) => const FunkyOverlay(
                           mainImage: AssetImage('assets/images/garden.png'),
                          title: 'Beautiful Garden',
                          subtitle: 'Bio for life',
                          body: 'Maratona',
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.95,
                      //margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/garden.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        /*border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.bottomLeft,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(' LoremIpsum',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 226),
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                /*background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,*/
                              )),
                          Text('   The way of the bees',
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 226),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                /*background: Paint()
                                  ..color = Colors.black.withOpacity(0.4)
                                  ..style = PaintingStyle.fill,*/
                              )),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        );
  }
}