import 'dart:math';

import 'package:app_project/models/missions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:app_project/providers/medals_provider.dart';
//import 'package:app_project/screens/login_page.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  final _pageController = PageController(viewportFraction: 0.8);
  Missions missions = Missions();

  @override
  Widget build(BuildContext context) {
    // watch method allows us to inform medals var if its state is
    // changing inside medals_provider

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 228),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 130, bottom: 400),
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
              Consumer<Missions>(builder: ((context, missions, child) {
                return Container(
                    child: Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      missions.addProjectToCount();
                      missions.checkMissions();
                    },
                    child: Text('+'),
                  ),
                ));
              })),
              Consumer<Missions>(
                builder: ((context, missions, child) {
                  return Container(
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
                                ? Colors.green
                                : Colors.red,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
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
                  itemCount: 3,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
