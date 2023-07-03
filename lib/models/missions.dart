import 'package:flutter/material.dart';
import 'package:app_project/models/medals.dart';

class Missions extends ChangeNotifier{

  int missionsNumber = 3;
  int supportedProjectsNumber = 0;

  final List<Medal> _medals = [Medal(title: '1'),Medal(title: '2'),Medal(title: '3')];
  List<Medal> get medals => _medals;

  void addProjectToCount(){
    supportedProjectsNumber += 1;
    notifyListeners();
  }

  void checkMissions(){
    supportedProjectsNumber >= 3 ? medals[0].setCompleted() : null;
    supportedProjectsNumber >= 5 ? medals[1].setCompleted() : null;
    supportedProjectsNumber >= 10 ? medals[2].setCompleted() : null;
    notifyListeners();
  }

}