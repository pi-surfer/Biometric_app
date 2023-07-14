//Imports that are necessary to the code generator of floor
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'daos/dao.dart';
import 'entities/entities.dart';
import 'typeConverters/timeConverter.dart';

part 'db.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [HR, Steps, Cal])
abstract class DatabaseFit extends FloorDatabase {
  HeartRatesDao get heartRatesDao;
  StepsDao get stepsDao;
  CaloriesDao get caloriesDao;
}//AppDatabase
