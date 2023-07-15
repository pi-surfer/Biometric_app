import 'package:app_project/database/db.dart';
import 'package:app_project/database/entities/heartrate.dart';
import 'package:app_project/database/entities/calories.dart';
import 'package:app_project/database/entities/steps.dart';

import 'package:flutter/material.dart';

class DataBaseRepository extends ChangeNotifier {

//The state of the database is just the AppDatabase
final DatabaseFit database;

//Default constructor
DataBaseRepository({required this.database});

//This method wraps the findAllDuration() method of the DA
/*Future<List<Calories?>> findAllDayData(dateOnly, dateTime) async{
   final results = await database.caloriesDao.fi(dateOnly, dateTime);
    return results;
}*/
Future<List<Calories>> findCaloriesbyDate(DateTime startTime, DateTime endTime) async {
  final results = await database.caloriesDao.findCaloriesbyDate(startTime,endTime);
  return results;
  }

Future<List<Calories?>> findDayDataCal() async{
  final results = await database.caloriesDao.findDayDataCal();
    return results;
}

Future<void> insertCalories(calories) async {
  final results = await database.caloriesDao.insertCalories(calories);
  return results;
}

Future<void> deleteCalories(calories) async{
  final results = await database.caloriesDao.deleteCalories(calories);
  return results;
}

Future<void> updateCalories(calories) async {
  final results = await database.caloriesDao.updateCalories(calories);
  return results;
}


/*Future<List<Steps?>> findAllDayData(day) async{
   final results = await database.stepsDao.findAllDayData(day);
    return results;
}*/

Future<List<Steps>> findStepsbyDate(DateTime startTime, DateTime endTime) async {
  final results = await database.stepsDao.findStepsbyDate(startTime,endTime);
  return results;
  }

Future<List<Steps>> findAllSteps() async {
  final results = await database.stepsDao.findAllSteps();
  return results;
}

Future<void> insertSteps(steps) async {
  final results = await database.stepsDao.insertSteps(steps);
  return results;
}

Future<void> deleteSteps(steps) async{
  final results = await database.stepsDao.deleteSteps(steps);
  return results;
}

Future<void> updateSteps(steps) async {
  final results = await database.stepsDao.updateSteps(steps);
  return results;
}


/*Future<List<HR?>> findAllDayData(day) async{
   final results = await database.heartRatesDao.findAllDayData(day);
    return results;
}*/

Future<List<HR>> findHeartRatesbyDate(startDate, endDate) async {
  final results = await database.heartRatesDao.findHeartRatesbyDate(startDate, endDate);
    return results;
}

Future<List<HR>> findAllHeartRates() async {
  final results = await database.heartRatesDao.findAllHeartRates();
    return results;
}

Future<void> insertHeartRate(heartRate) async {
  final results = await database.heartRatesDao.insertHeartRate(heartRate);
  return results;
}

Future<void> deleteHeartRate(heartRate) async{
  final results = await database.heartRatesDao.deleteHeartRate(heartRate);
  return results;
}

Future<void> updateHeartRate(heartRate) async {
  final results = await database.heartRatesDao.updateHeartRate(heartRate);
  return results;
}
}