import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class DailyScoreDao {
   @Query('SELECT * FROM DAILYSCORE AT DAY :dateTime')
  Future<DailyScore?> findDailyScorebyDate(String dateTime);

  @Query('SELECT * FROM DAILYSCORE')
  Future<List<DailyScore>> findAllDailyScore();

  @insert
  Future<void> insertDailyScore(DailyScore dailyScore);

  @delete
  Future<void> deleteDailyScore(DailyScore dailyScore);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateDailyScore(DailyScore dailyScore);
}