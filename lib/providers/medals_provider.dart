import 'package:app_project/models/medals.dart';
import 'package:flutter/material.dart';

int missionsNumber = 10;
int supportedProjectsNumber = 0;

// Here we will define all the Missions:

List<Medal> check(int missionsNumber) {
  final List<int> completedMissions =
      List.generate(missionsNumber, (index) => 0);
  supportedProjectsNumber >= 3 ? completedMissions[0] = 1 : null; // Mission 1
  supportedProjectsNumber >= 5 ? completedMissions[1] = 1 : null; // Mission 2
  supportedProjectsNumber >= 10 ? completedMissions[2] = 1 : null; // Mission 3

  final List<Medal> data = List.generate(
      missionsNumber,
      ((index) => Medal(
          title: '$index',
          isCompleted: completedMissions[index] == 1 ? true : false)));
  return data;
}

class MedalsProvider with ChangeNotifier {
  final List<Medal> _medals = check(missionsNumber);
  List<Medal> get medals => _medals;
}
// I'm not sure this provider is really usefull, something is missing.
// If a mission status will change does the visualization change?

// https://www.youtube.com/watch?v=SRHkYKBClUI