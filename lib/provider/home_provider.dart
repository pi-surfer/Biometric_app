//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_project/utils/algorithm.dart';
//import 'package:app_project/utils/shared_preferences.dart';
import 'package:app_project/services/impact.dart';
import 'package:app_project/database/db.dart';
import 'package:app_project/database/entities/entities.dart';

class HomeProvider extends ChangeNotifier {

  late List<HR> heartRates;
  late List<Cal> calories;
  late List<Steps> steps;
  late AerobicTime? aerobicTime;
  late TotSteps? totalSteps;
  late TotCal? totalCalories;
  late DailyScore? dailyScore;

  final DatabaseFit db;
  late int globalScore = 0;

  late List<HR> _heartRates;
  late List<Cal> _calories;
  late List<Steps> _steps;
  late TotCal _totalCalories;
  late TotSteps _totalSteps;
  late AerobicTime _aerobicTime;
  late DailyScore _dailyScore;

  late int ValueDailyScore = 0;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

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
    print('doneInit' + doneInit.toString());
    notifyListeners();
  }

  Future<DateTime?> _getLastFetch() async {
    var data = await db.stepsDao.findAllSteps();
    if (data.isEmpty) {
      return null;
    }
    return DateTime.parse(data.last.dateTime);
  }

  Future<void> _fetchAndCalculate() async {

    print('QUESTAAAA OKKK');

    lastFetch = await _getLastFetch() ??
        DateTime.now().subtract(const Duration(days: 1));
    // do nothing if already fetched
    //if (lastFetch.day == DateTime.now().subtract(const Duration(days: 1)).day) {
      //return;
    //}

    _steps = await impactService.getStepFromDay(DateUtils.dateOnly(lastFetch));

    print('STEP ' + _steps.toString());

    _heartRates = await impactService.getHRFromDay(DateUtils.dateOnly(lastFetch));
    _calories = await impactService.getCalFromDay(DateUtils.dateOnly(lastFetch));

    _dailyScore = DailyScore(await _calculateDailyScore(_heartRates,_steps,_calories), dateFormat.format(DateUtils.dateOnly(lastFetch)));
    //db.dailyScoreDao.insertDailyScore(_dailyScore);

    _totalCalories = TotCal(getTotalCalories(_calories), dateFormat.format(DateUtils.dateOnly(lastFetch)));
    print('${(dateFormat.format(DateUtils.dateOnly(lastFetch))).runtimeType}');
    db.totCalDao.insertTotCal(_totalCalories);

    _totalSteps = TotSteps(getTotalSteps(_steps), dateFormat.format(DateUtils.dateOnly(lastFetch)));
    db.totStepsDao.insertTotSteps(_totalSteps);

    _aerobicTime = AerobicTime(getAerobicTime(_heartRates), dateFormat.format(DateUtils.dateOnly(lastFetch)));
    db.aerobicTimeDao.insertAerobicTime(_aerobicTime);

    print('ECCOOO ' + _heartRates.toString() + _steps.toString() + _totalSteps.toString());
    print('TOTAL STEPS ' '${_totalSteps.value}' '${DateUtils.dateOnly(lastFetch)}');
  }

  Future<void> refresh() async {
    await _fetchAndCalculate();
    await getDataOfDay(showDate);
  }

  int _calculateDailyScore(List<HR> hr, List<Steps> steps, List<Cal> cal) {
    var totSteps = getTotalSteps(steps);
    var totCal = getTotalCalories(cal);
    var aerobicTime = getAerobicTime(hr);
    
    ValueDailyScore = getDailyScore(totCal,totSteps,aerobicTime);
    return ValueDailyScore;
  }

  Future<void> getDataOfDay(DateTime showDate) async {
        
    this.showDate = showDate;
    /*heartRates = await db.heartRatesDao.findHeartRatesbyDate(
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
    notifyListeners(); */

    totalSteps = await db.totStepsDao.findTotStepsbyDate(dateFormat.format(DateUtils.dateOnly(showDate)));
    notifyListeners();

    totalCalories = await db.totCalDao.findTotCalbyDate(dateFormat.format(DateUtils.dateOnly(showDate)));
    notifyListeners();

    aerobicTime = await db.aerobicTimeDao.findAerobicTimebyDate(dateFormat.format(DateUtils.dateOnly(showDate)));
    notifyListeners();

    //dailyScore = await db.dailyScoreDao.findDailyScorebyDate(dateFormat.format(DateUtils.dateOnly(showDate)));
    //notifyListeners();

    print('DATA ' + '${dateFormat.format(DateUtils.dateOnly(showDate))}');

    print(totalSteps?.value.toString() );
  }
}
