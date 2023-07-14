import 'package:app_project/database/db.dart';
import 'package:app_project/database/entities/calories.dart';
import 'package:app_project/database/entities/steps.dart';
import 'package:app_project/database/entities/heartrates.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier{

  //The state of the database is just the AppDatabase
  final DatabaseFit database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllSteps() method of the DAO
  Future<List<Steps>> findAllSteps() async{
    final results = await database.stepsDao.findAllSteps();
    return results;
  }//findAllSteps

  //This method wraps the insertSteps() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> insertSteps(Steps steps)async {
    await database.stepsDao.insertSteps(steps);
    notifyListeners();
  }//insertSteps

  //This method wraps the deleteSteps() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> deleteSteps(Steps steps) async{
    await database.stepsDao.deleteSteps(steps);
    notifyListeners();
  }//removeSteps

//This method wraps the findAllHeartRates() method of the DAO
  Future<List<HR>> findAllHeartRates() async{
    final results = await database.heartRatesDao.findAllHeartRates();
    return results;
  }//findAllHeartRates

  //This method wraps the insertHeartRates() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> insertHeartRate(HR heartRates) async {
    await database.heartRatesDao.insertHeartRate(heartRates);
    notifyListeners();
  }//insertHeartRates

  //This method wraps the deleteHeartRates() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> deleteHeartRate(HR heartRates) async{
    await database.heartRatesDao.deleteHeartRate(heartRates);
    notifyListeners();
  }//removeHeartRates

  //This method wraps the findAllCalories() method of the DAO
  Future<List<Cal>> findAllCalories() async{
    final results = await database.caloriesDao.findAllCalories();
    return results;
  }//findAllCalories

  //This method wraps the insertCalories() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> insertCalories(Cal calories)async {
    await database.caloriesDao.insertCalories(calories);
    notifyListeners();
  }//insertCalories

  //This method wraps the deleteCalories() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> deleteCalories(Cal calories) async{
    await database.caloriesDao.deleteCalories(calories);
    notifyListeners();
  }//removeCalories

  
}//DatabaseRepository