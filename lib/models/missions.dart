import 'package:flutter/material.dart';
import 'dart:math';

class Medal extends ChangeNotifier {
  final String title;
  bool isCompleted;
  Color color;

  Medal({required this.title, this.isCompleted = false, this.color = Colors.grey});

  void setCompleted(){
    isCompleted = true;
    notifyListeners();
  }
}

class Missions extends ChangeNotifier{

  int missionsNumber = 8;
  final List<Medal> medals = List.generate(
    8,  // missionsNumber
      (index) => Medal(title: '$index',color: Colors.primaries[Random().nextInt(Colors.primaries.length)])
  );

  //final List<Medal> _medals = List[Medal(title: '1'),Medal(title: '2'),Medal(title: '3')];
  //List<Medal> get medals => _medals;

  void checkMissions(int? supportedProjectsNumber){

    //Here we define all the missions (conditions to reach each medal)

    supportedProjectsNumber! >= 3 ? medals[0].setCompleted() : null;
    supportedProjectsNumber >= 5 ? medals[1].setCompleted() : null;
    supportedProjectsNumber >= 10 ? medals[2].setCompleted() : null;
    supportedProjectsNumber >= 20 ? medals[3].setCompleted() : null;
    supportedProjectsNumber >= 50 ? medals[4].setCompleted() : null;
    supportedProjectsNumber >= 100 ? medals[5].setCompleted() : null;
    supportedProjectsNumber >= 150 ? medals[6].setCompleted() : null;
    supportedProjectsNumber >= 200 ? medals[7].setCompleted() : null;
    notifyListeners();
  }
}

// About providers: https://blog.logrocket.com/quick-guide-provider-flutter-state-management/
// About consumers: https://flutterbyexample.com/lesson/rebuilding-widgets-with-consumer