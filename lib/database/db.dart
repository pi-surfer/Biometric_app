import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'daos/dao.dart';
import 'entities/entities.dart';
import 'typeConverters/timeConverter.dart';
//import 'package:app_project/utils/algorithm.dart';

part 'db.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [HR, Calories, Steps])
abstract class DatabaseFit extends FloorDatabase {
  //Add all the daos as getters here
  HeartRatesDao get heartRatesDao;
  CaloriesDao get caloriesDao;
  StepsDao get stepsDao;
}//AppDatabase


/*class HR {
  // this class models the single heart rate data point
  final DateTime timestamp;
  final int value;

  HR({required this.timestamp, required this.value});

  HR.fromJson(String date, Map<String, dynamic> json) :
      timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').parse('$date ${json["time"]}'),
      value = json["value"];

  @override
  String toString() {
    return 'heartRate(time: $timestamp, value: $value)';
  }//toString
}


class Steps{
  final DateTime timestamp;
  final int value;

  Steps({required this.timestamp, required this.value});

  Steps.fromJson(String date, Map<String, dynamic> json) :
      timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').parse('$date ${json["time"]}'),
      value = int.parse(json["value"]);

  @override
  String toString() {
    return 'Steps(time: $timestamp, value: $value)';
  }//toString
}//Steps

class Kalories {
  final DateTime timestamp;
  final double value;

  Kalories({required this.timestamp, required this.value});

  Kalories.fromJson(String date, Map<String, dynamic> json) :
      timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').parse('$date ${json["time"]}'),
      value = double.parse(json["value"]);

  @override
  String toString() {
    return 'Kalories(time: $timestamp, value: $value)';
  }//toString

}

class FitbitGen {
  final Random _random = Random();

  List<HR> fetchHR() {
    return List.generate(
        100,
        (index) => HR(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextInt(180)));
  }

  List<Kalories> fetchKalories() {
    return List.generate(
        100,
        (index) => Kalories(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextDouble()));
  }

  List<Steps> fetchSteps() {
    return List.generate(
        100,
        (index) => Steps(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextInt(50000)));
  }


}*/