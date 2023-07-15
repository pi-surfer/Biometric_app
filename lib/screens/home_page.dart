import 'package:app_project/models/projects.dart';
import 'package:app_project/models/partner.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_project/widgets/linechart_week.dart';
import 'package:app_project/models/funky_overlays.dart';
import 'package:app_project/models/text_styles.dart';
import 'package:app_project/provider/home_provider.dart';
import 'package:app_project/screens/profile_page.dart';
//import 'package:app_project/models/db.dart' as db;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO : VORREI ACCEDER ALLA SHARED PREFERENCE SALVATA NEL PROFILO IN MODO DA SOSTITUIRE 'MASSIMO' CON IL NOME INSERITO, NON SO COME FARLO
  String? name;
  late SharedPreferences name_;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    name_ = await SharedPreferences.getInstance();
    setState(() {
      name = name_.getString('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 249, 226),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 100, left: 8, right: 8, top: 30),
            child: Consumer<HomeProvider>(
              builder: (context, provider, child) => Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thank you, ' '$name' '!',
                            style: titleStyle,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'It is nice working together for an healtier planet',
                            style: subtitleStyle,
                            textAlign: TextAlign.start,
                          ),
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Consumer<SelectedProject>(builder: (context, project, child) {
                  if (project.getSelectedProject() >= 0) {
                    Projects selectedProject =
                        project.proj[project.getSelectedProject()];
                    debugPrint('${project.getSelectedProject()}');
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.3),
                          context: context,
                          builder: (_) => FunkyOverlay(
                            mainImage: AssetImage(selectedProject.imagePath),
                            title: selectedProject.name,
                            subtitle: selectedProject.address,
                            body: selectedProject.phrase,
                            isSelected: selectedProject.light,
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(selectedProject.imagePath),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(selectedProject.name,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            Text(selectedProject.address,
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
                    );
                  } else {
                    return Container(
                        height: 200.0,
                        width: 400.0,
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        decoration: BoxDecoration(
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: Text('No project was selected'),
                        ));
                  }
                }),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 25),
                        Text(
                          'Your Progress',
                          style: titleStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    LinearPercentIndicator(
                      animation: true,
                      width: 360.0,
                      lineHeight: 30,
                      percent: provider.GlobalScore / 90,
                      barRadius: Radius.circular(20),
                      backgroundColor:
                          Color.fromARGB(100, 255, 221, 74).withOpacity(0.6),
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
                        Text(
                          '${provider.GlobalScore}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Poppins',
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
                      child: LineChartWeek(), // Grafico linea da chart1.dart
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(

                              /// qui cambiamo con punteggio perchè non facciamo i giorni
                              'Not bad! \nIf you will continue like this you will reach your goal',
                              textAlign: TextAlign.start,
                              style: bodyStyle),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(width: 25),
                    Text(
                      'Take a look at this!',
                      style: titleStyle,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Consumer<SelectedPartner>(builder: (context, partner, child) {
                    Sponsor selectedPartner =
                        partner.sponsor[partner.getSelectedPartner()];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: const Color.fromARGB(255, 56, 56, 56)
                              .withOpacity(0.3),
                          context: context,
                          builder: (_) => FunkyOverlay(
                            mainImage: AssetImage(selectedPartner.imagePath),
                            title: selectedPartner.name,
                            subtitle: 'PARTNER OF THE WEEK',
                            body: 'This reality is demonstrating its commitment to supporting small businesses and the well-being of the individual, which is why it won the partner of the week award',
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
                            image: AssetImage(selectedPartner.imagePath),
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
                            Text(selectedPartner.name,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  background: Paint()
                                    ..color = Colors.black.withOpacity(0.4)
                                    ..style = PaintingStyle.fill,
                                )),
                            Text(selectedPartner.phrase,
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
                    );}),
                        
                const SizedBox(height: 20),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}