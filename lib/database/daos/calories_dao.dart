import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class CaloriesDao {
   @Query('SELECT * FROM CALORIES WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<Cal>> findCaloriesbyDate(DateTime startTime, DateTime endTime);

  @Query('SELECT * FROM CALORIES')
  Future<List<Cal>> findAllCalories();

  @insert
  Future<void> insertCalories(Cal calories);

  @delete
  Future<void> deleteCalories(Cal calories);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCalories(Cal calories);
}//HeartRatesDao