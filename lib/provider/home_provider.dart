import 'dart:math';
import 'package:flutter/material.dart';

import 'package:app_project/database/db.dart';
import 'package:app_project/database/entities/entities.dart';
import 'package:app_project/utils/shared_preferences.dart';
import 'package:app_project/services/impact.dart';
import 'package:app_project/services/server_strings.dart';
import 'package:app_project/utils/algorithm.dart';

import '../models/projects.dart';

class HomeProvider extends ChangeNotifier {
   late List<HR> heartRates;
   late int aerobicTime;
   late List<Calories> calories;
   late double totalCalories;
   late List<Steps> steps;
   late int totalSteps;
   final DatabaseFit db;

   late List<Projects> projects;
   late int dailyScore = 0;
   late int GlobalScore = 0;
   //late List<Reward> reward;
   //late List<Missions> mission;
   //late List<Partner> partners; 

   late List<HR> _heartRates;
   //late List<Times> _timesDB;
   late List<Calories> _calories;
   late List<Steps> _steps; 

   // selected day of data to be shown
   DateTime showDate = DateTime.now().subtract(const Duration(days: 1));

   // data generators faking external services
   //final FitbitGen fitbitGen = FitbitGen();
   late DateTime lastFetch;
   final ImpactService impactService;
   final Random _random = Random();
   bool doneInit = false;

   HomeProvider(this.impactService, this.db) {
   _init();
  }

  Future<void> _init() async {
    await _fetchAndCalculate();
    await getDataOfDay(showDate);
    doneInit = true;
    notifyListeners();
  }

  Future<DateTime?> _getLastFetch() async {
    var data = await db.heartRatesDao.findAllHeartRates();
    if (data.isEmpty) {
      return null;
    }
    return data.last.dateTime;
  }

  //DateTime lastFetch = DateTime.now().subtract(Duration(days: 7));
  //DateTime lastFetch = DateTime.now().subtract(Duration(days: 1));

  Future<void> _fetchAndCalculate() async {
    lastFetch = await _getLastFetch() ??
        DateTime.now().subtract(const Duration(days: 2));
    // do nothing if already fetched
    if (lastFetch.day == DateTime.now().subtract(const Duration(days: 1)).day) {
      return;
    }
    _heartRates = await impactService.getDataFromDay(lastFetch);
    for (var element in _heartRates) {
      db.heartRatesDao.insertHeartRate(element);
    } // db add to the table

    _calories = await impactService.getDataFromDay(lastFetch);
    for (var element in _calories) {
      db.caloriesDao.insertCalories(element);
    } // db add to the table

    _steps = await impactService.getDataFromDay(lastFetch);
    for (var element in _steps) {
      db.stepsDao.insertSteps(element);
    } // db add to the table
  }

  // method to trigger a new data fetching
  Future<void> refresh() async {
    await _fetchAndCalculate();
    await getDataOfDay(showDate);
  }

  Future<void> getDataOfDay(DateTime showDate) async {
    // check if the day we want to show has data
    var firstDay = await db.stepsDao.findFirstDayInDb();
    var lastDay = await db.stepsDao.findLastDayInDb();
    if (showDate.isAfter(lastDay!.dateTime) ||
        showDate.isBefore(firstDay!.dateTime)) return;
        
    this.showDate = showDate;
    heartRates = await db.heartRatesDao.findAllHeartRates(
        DateUtils.dateOnly(showDate),
        DateTime(showDate.year, showDate.month, showDate.day, 23, 59));
    calories = await db.caloriesDao.findAllCalories(
        DateUtils.dateOnly(showDate),
        DateTime(showDate.year, showDate.month, showDate.day, 23, 59));
    steps = await db.stepsDao.findAllSteps(
        DateUtils.dateOnly(showDate),
        DateTime(showDate.year, showDate.month, showDate.day, 23, 59));
    
    
    // after selecting all data we notify all consumers to rebuild
    notifyListeners();
  }



  /*Future<void> _fetchAndCalculate() async {
    _heartRatesDB = await impactService.getHRFromDay(lastFetch);
    _stepsDB = await impactService.getStepFromDay(lastFetch);
    _kaloriesDB = await impactService.getKalFromDay(lastFetch);
    aerobicTime = getAerobicTime(_heartRatesDB);
    totalKalories = getTotalKalories(_kaloriesDB);
    totalSteps = getTotalSteps(_stepsDB);
    //GlobalScore = getGlobalScore() as int;
    dailyScore = getDailyScore(totalKalories, totalSteps, aerobicTime);

    debugPrint('\naerobicTime = $aerobicTime min');
    debugPrint('totalKalories = $totalKalories kal');
    debugPrint('totalSteps = $totalSteps steps \n');
    
    //_heartRatesDB = fitbitGen.fetchHR();
    //_timesDB = fitbitGen.fetchTimes();
    //_stepsDB = fitbitGen.fetchSteps();
    //_kaloriesDB = fitbitGen.fetchKalories();
    
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
    aerobicTime = getAerobicTime(heartRates);
    totalSteps = getTotalSteps(steps);
    totalKalories = getTotalKalories(kalories);
    dailyScore = getDailyScore(totalKalories, totalSteps, aerobicTime);
    debugPrint('$dailyScore');
    /*times = _timesDB
        .where((element) => element.timestamp.day == showDate.day)
        .toList()
        .reversed
        .toList(); */
    //fullexposure = exposure.map((e) => e.value).reduce(
      //    (value, element) => value + element,
      //  );
    // after selecting all data we notify all consumers to rebuild
    notifyListeners();
  }

  Future<bool> _saveDailyScore() async {
    //final score = getDailyScore(totalKalories, totalSteps, aerobicTime);
    final score = dailyScore;
    SharedPreferences prefs_score = await SharedPreferences.getInstance();
    return prefs_score.setInt('dailyScore', score);
  }

  Future<int?> _getDailyScore() async{
    SharedPreferences prefs_score = await SharedPreferences.getInstance();
    return prefs_score.getInt('dailyScore');
  }

  Future<int> getGlobalScore() async{
    int GlobalScore = 0;
    int ds = dailyScore;
    //int ds = getDailyScore(totalKalories, totalSteps, aerobicTime);
    //int? ds = await _getDailyScore();
    GlobalScore = GlobalScore + ds;
    if (GlobalScore > 90) {
      GlobalScore = 0;
    }
    return GlobalScore;
  }

  Future<bool> _saveGlobalScore() async {
    final gscore = getGlobalScore();
    SharedPreferences prefs_gscore = await SharedPreferences.getInstance();
    return prefs_gscore.setInt('globalScore', gscore as int);
  }

  Future<int?> _getGlobalScore() async{
    SharedPreferences prefs_gscore = await SharedPreferences.getInstance();
    return prefs_gscore.getInt('globalScore');
  }*/
}




