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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 216),
      /*drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 13, 129, 52),
              ),
              child: Text('My Profile'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.only(top: 130,bottom: 80,left: 8,right: 8),
        child: CustomScrollView(slivers: [
          /*SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            collapsedHeight: 60,
            toolbarHeight: 60,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Hello Bob!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.7,
              background: Icon(Icons.image_rounded, color: Colors.white),
            ),
            actions: [
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
            ],
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.person),
                iconSize: 40,
              );
            }),
            backgroundColor: Color.fromARGB(255, 11, 96, 45),
            shadowColor: Color.fromARGB(255, 4, 47, 15), // actions AppBar
          ),*/
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
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
                        SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: 
                          Image.asset('assets/images/logo1.png', fit:BoxFit.cover, ),),
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
                    color: Colors.white,
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
                            backgroundColor: Color.fromARGB(255, 255, 200, 36).withOpacity(0.4),
                            progressColor: Color.fromARGB(255, 255, 200, 36),
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
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border:
                      Border.all(width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Text('How are you doing?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.transparent,),
                    //height: 300,
                    padding: const EdgeInsets.only(left: 10,right: 20),
                    // implement the bar chart
                    child: LineChartWeek(),    // Grafico linea da chart1.dart
                  ),
                  Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                              'Not bad! If you will continue like this you will reach your goal within 25 days.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16)))
                ],
              ),
            ),
            Column(children: [
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
                          color: Colors.white,
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
                          color: Colors.white,
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
      ));
}}