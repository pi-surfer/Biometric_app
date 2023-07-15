import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app_project/utils/algorithm.dart';
import 'package:app_project/utils/shared_preferences.dart';
import 'package:app_project/services/impact.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_project/screens/skeleton_page.dart';
import 'package:app_project/database/db.dart';
import 'package:app_project/database/entities/entities.dart';

import '../models/projects.dart';

class HomeProvider extends ChangeNotifier {
  late List<HR> heartRates;
  late AerobicTime aerobicTime;
  late List<Cal> calories;
  late TotCal totalCalories;
  late List<Steps> steps;
  late TotSteps totalSteps;
  final DatabaseFit db;
  late int globalScore = 0;

  late List<HR> _heartRates;
  late List<Cal> _calories;
  late List<Steps> _steps;

  late int _dailyScore = 0;
  late DailyScore dailyScore;

  // selected day of data to be shown
  DateTime showDate = DateTime.now().subtract(const Duration(days: 1));

  late DateTime lastFetch;
  final ImpactService impactService;

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
    var data = await db.stepsDao.findAllSteps();
    if (data.isEmpty) {
      return null;
    }
    return data.last.dateTime;
  }

  Future<void> _fetchAndCalculate() async {

    lastFetch = await _getLastFetch() ??
        DateTime.now().subtract(const Duration(days: 1));
    // do nothing if already fetched
    if (lastFetch.day == DateTime.now().subtract(const Duration(days: 1)).day) {
      return;
    }

    _steps = await impactService.getStepFromDay(lastFetch);
    _heartRates = await impactService.getHRFromDay(lastFetch);
    _calories = await impactService.getCalFromDay(lastFetch);

    dailyScore = DailyScore(await _calculateDailyScore(_heartRates,_steps,_calories),lastFetch);
    db.dailyScoreDao.insertDailyScore(dailyScore);

    totalCalories = TotCal(getTotalCalories(_calories) as int, lastFetch);
    db.totCalDao.insertTotCal(totalCalories);

    totalSteps = TotSteps(getTotalSteps(_steps), lastFetch);
    db.totStepsDao.insertTotSteps(totalSteps);

    aerobicTime = AerobicTime(getAerobicTime(_heartRates), lastFetch);
    db.aerobicTimeDao.insertAerobicTime(aerobicTime);
  }

  Future<void> refresh() async {
    await _fetchAndCalculate();
    await getDataOfDay(showDate);
  }

  int _calculateDailyScore(List<HR> hr, List<Steps> steps, List<Cal> cal) {
    var totSteps = getTotalSteps(steps);
    var totCal = getTotalCalories(cal);
    var aerobicTime = getAerobicTime(hr);
    
    _dailyScore = getDailyScore(totCal,totSteps,aerobicTime);
    return _dailyScore;
  }

  Future<void> getDataOfDay(DateTime showDate) async {
        
    this.showDate = showDate;
    heartRates = await db.heartRatesDao.findHeartRatesbyDate(
        DateUtils.dateOnly(showDate),
        DateTime(showDate.year, showDate.month, showDate.day, 23, 59));
    notifyListeners();

    calories = await db.caloriesDao.findCaloriesbyDate(
        DateUtils.dateOnly(showDate),
        DateTime(showDate.year, showDate.month, showDate.day, 23, 59));
    notifyListeners();

    steps = await db.stepsDao.findStepsbyDate(
        DateUtils.dateOnly(showDate),
        DateTime(showDate.year, showDate.month, showDate.day, 23, 59));
    notifyListeners();
  }
}
