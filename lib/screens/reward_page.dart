import 'package:app_project/models/reward_structure.dart';
import 'package:app_project/models/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'package:app_project/models/missions.dart';
import 'package:app_project/models/reward.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  final List<Reward> rewards = getReward();
  final _pageController = PageController(viewportFraction: 0.8);
  TextStyle statStyle = const TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          Consumer<Missions>(builder: ((context, missions, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                _addOne();
                final sp = await SharedPreferences.getInstance();
                var supportedProjectNumber =
                    sp.getInt('supportedProjectNumber');
                missions.checkMissions(supportedProjectNumber);
              },
              child: Text('+'),
            ),
            FloatingActionButton(
              onPressed: () async {
                final sp = await SharedPreferences.getInstance();
                sp.setInt('supportedProjectNumber', 0);
                missions.checkMissions(0);
              },
              child: Text('0'),
            ),
          ],
        );
      })),
      backgroundColor: const Color.fromARGB(255, 254, 251, 228),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 30, bottom: 100),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    children: [
                      Text(
                        'Hard work pays off!!',
                        style: titleStyle,
                      ),
                    ],
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return RewardItem(
                            name: rewards[index].name,
                            qrcode: rewards[index].qrcode,
                            phrase: rewards[index].phrase,
                            imagePath: rewards[index].imagePath);
                      }))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(
                    children: [
                      Text(
                        'Statistics:',
                        textAlign: TextAlign.start,
                        style: titleStyle,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Consumer<Missions>(builder: (context, missions, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Supported projects:',
                                    style: statStyle,
                                  ),
                                  Text(
                                    'Active discounts: ',
                                    style: statStyle,
                                  ),
                                  Text(
                                    'Medals reached: ',
                                    style: statStyle,
                                  ),
                                ]),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                  future: SharedPreferences.getInstance(),
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      final sp =
                                          snapshot.data as SharedPreferences;
                                      if (sp.getInt('supportedProjectNumber') ==
                                          null) {
                                        sp.setInt('supportedProjectNumber', 0);
                                        return Text(
                                          '0',
                                          style: statStyle,
                                        );
                                      } else {
                                        final supportedProjectNumber = sp
                                            .getInt('supportedProjectNumber')!;
                                        return Column(
                                          children: [
                                            Text(
                                              '$supportedProjectNumber',
                                              style: statStyle,
                                            ),
                                            Text(
                                              'x',
                                              style: statStyle,
                                            ),
                                            Text(
                                              missions.medals
                                                  .where((i) => i.isCompleted)
                                                  .length
                                                  .toString(),
                                              style: statStyle,
                                            ),
                                          ],
                                        );
                                      }
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ],
                  )),
            ])),
      ),
    ));
  }

  void _addOne() async {
    final sp = await SharedPreferences.getInstance();
    setState(() {
      var supportedProjectNumber = sp.getInt('supportedProjectNumber');
      if (supportedProjectNumber != null) {
        supportedProjectNumber++;
        sp.setInt('supportedProjectNumber', supportedProjectNumber);
      }
    });
  } //_addOne
}
