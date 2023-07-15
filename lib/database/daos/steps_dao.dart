import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class StepsDao {
   @Query('SELECT * FROM STEPS WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<Steps>> findStepsbyDate(DateTime startTime, DateTime endTime);

  @Query('SELECT * FROM STEPS')
  Future<List<Steps>> findAllSteps();

  @insert
  Future<void> insertSteps(Steps steps);

  @delete
  Future<void> deleteSteps(Steps steps);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSteps(Steps steps);
}//HeartRatesDao