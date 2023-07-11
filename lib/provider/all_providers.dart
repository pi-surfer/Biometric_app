import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app_project/models/db.dart';
import 'package:app_project/utils/algorithm.dart';
import 'package:app_project/utils/shared_preferences.dart';
import 'package:app_project/services/impact.dart';
import 'package:app_project/services/server_strings.dart';

class HomeProvider extends ChangeNotifier {
   late List<HR> heartRates;
   late List<Times> times;
   late List<Kalories> kalories;
   late List<Steps> steps;

   late List<Projects> progetto;
   late int score;
   late List<Reward> reward;
   late List<Mission> mission;
   late List<Parters> partners; 

   late List<HR> _heartRatesDB;
   late List<Times> _timesDB;
   late List<Kalories> _kaloriesDB;
   late List<Steps> _stepsDB; 

   // selected day of data to be shown
   DateTime showDate = DateTime.now().subtract(const Duration(days: 1));

   // data generators faking external services
   final FitbitGen fitbitGen = FitbitGen();
   final ImpactService impactService;
   final Random _random = Random();

   DateTime lastFetch = DateTime.now().subtract(Duration(days: 7));

  void _fetchAndCalculate() {
    _heartRatesDB = fitbitGen.fetchHR();
    _timesDB = fitbitGen.fetchTimes();
    _stepsDB = fitbitGen.fetchSteps();
    _kaloriesDB = fitbitGen.fetchKalories();
    
  }

   void getDataOfDay(DateTime showDate) {
    this.showDate = showDate;
    heartRates = _heartRatesDB
        .where((element) => element.timestamp.day == showDate.day)
        .toList()
        .reversed
        .toList();
    steps = _stepsDB
        .where((element) => element.timestamp.day == showDate.day)
        .toList()
        .reversed
        .toList();
    kalories = _kaloriesDB
        .where((element) => element.timestamp.day == showDate.day)
        .toList()
        .reversed
        .toList();
    times = _timesDB
        .where((element) => element.timestamp.day == showDate.day)
        .toList()
        .reversed
        .toList();
    //fullexposure = exposure.map((e) => e.value).reduce(
      //    (value, element) => value + element,
      //  );
    // after selecting all data we notify all consumers to rebuild
    notifyListeners();
  }
}


