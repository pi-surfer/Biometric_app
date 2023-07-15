import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class TotStepsDao {
   @Query('SELECT * FROM TOTALSTEPS AT DAY :day')
  Future<TotSteps?> findTotStepsbyDate(DateTime day);

  @Query('SELECT * FROM TOTALSTEPS')
  Future<List<TotSteps>> findAllTotSteps();

  @insert
  Future<void> insertTotSteps(TotSteps totSteps);

  @delete
  Future<void> deleteTotSteps(TotSteps totSteps);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTotSteps(TotSteps totSteps);
}