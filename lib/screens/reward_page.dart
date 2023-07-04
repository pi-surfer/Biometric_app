import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_project/models/missions.dart';

//import 'package:app_project/providers/medals_provider.dart';
//import 'package:app_project/screens/login_page.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  final _pageController = PageController(viewportFraction: 0.8);
  TextStyle statStyle = const TextStyle(fontSize: 18,);

  @override
  Widget build(BuildContext context) {
    // watch method allows us to inform medals var if its state is
    // changing inside medals_provider

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton:
            Consumer<Missions>(builder: ((context, missions, child) {
          return FloatingActionButton(
            onPressed: () {
              missions.addProjectToCount();
              missions.checkMissions();
            },
            child: Text('+'),
          );
        })),
        backgroundColor: const Color.fromARGB(255, 254, 251, 228),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: [
                        Text(
                          'Hard work pays off!!',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Consumer<Missions>(
                  builder: ((context, missions, child) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ListView.builder(
                        itemCount: missions.missionsNumber,
                        itemBuilder: (context, int index) {
                          final currentMedal = missions.medals[index];
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.18,
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: currentMedal.isCompleted == true
                                  ? currentMedal.color
                                  : currentMedal.color.withOpacity(0.25),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: currentMedal.isCompleted == true
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.transparent,
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                )
                              ],
                            ),
                            child: Center(
                                child: Text(
                              currentMedal.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 10,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 6),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text('Page $index'),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Column(
                      children: [
                        Text(
                          'Statistics:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Consumer<Missions>(
                          builder: (context, missions, child){
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Supported projects:', style: statStyle,),
                                    Text('Active discounts: ', style: statStyle,),
                                    Text('Medals reached: ', style: statStyle,),
                                  ]
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(missions.supportedProjectsNumber.toString(), style: statStyle,),
                                    Text('2', style: statStyle,),
                                    Text(missions.medals.where((i)=> i.isCompleted).length.toString(), style: statStyle,)
                                  ],
                                ),
                              ],
                            );
                            }),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
