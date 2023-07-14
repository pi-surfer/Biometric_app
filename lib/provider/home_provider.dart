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
  late int aerobicTime;
  late List<Cal> calories;
  late double totalCalories;
  late List<Steps> steps;
  late int totalSteps;
  final DatabaseFit db;

  late int dailyScore = 0;
  late int GlobalScore = 0;

  late List<HR> _heartRates;
  late List<Cal> _calories;
  late List<Steps> _steps;

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
    getDataOfDay(showDate);
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
        DateTime.now().subtract(const Duration(days: 2));
    // do nothing if already fetched
    if (lastFetch.day == DateTime.now().subtract(const Duration(days: 1)).day) {
      return;
    }
    _heartRates = await impactService.getDataFromDay(lastFetch);
    for (var element in _heartRates) {
      db.heartRatesDao.insertHeartRate(element);
    }
  }

  Future<void> refresh() async {
    await _fetchAndCalculate();
    await getDataOfDay(showDate);
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
