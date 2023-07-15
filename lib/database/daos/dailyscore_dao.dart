import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class DailyScoreDao {
   @Query('SELECT * FROM DAILYSCORE WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<DailyScore>> findDailyScorebyDate(DateTime startTime, DateTime endTime);

  @Query('SELECT * FROM DAILYSCORE')
  Future<List<DailyScore>> findAllDailyScore();

  @insert
  Future<void> insertDailyScore(DailyScore dailyScore);

  @delete
  Future<void> deleteDailyScore(DailyScore dailyScore);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateDailyScore(DailyScore dailyScore);
}