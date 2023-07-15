import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class TotStepsDao {
   @Query('SELECT * FROM TOTALSTEPS WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<TotSteps>> findDTotStepsDate(DateTime startTime, DateTime endTime);

  @Query('SELECT * FROM TOTALSTEPS')
  Future<List<TotSteps>> findAllTotSteps();

  @insert
  Future<void> insertTotSteps(TotSteps totSteps);

  @delete
  Future<void> deleteTotSteps(TotSteps totSteps);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTotSteps(TotSteps totSteps);
}