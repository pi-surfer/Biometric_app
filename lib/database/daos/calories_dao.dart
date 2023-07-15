import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class CaloriesDao {
  //Query #0: SELECT -> this allows to obtain all the entries of the kalories table of a certain date
  
  //Query #1: SELECT -> this allows to obtain all the entries of the kalories table
  @Query('SELECT * FROM CALORIES WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<Calories>> findCaloriesbyDate(DateTime startTime, DateTime endTime);

  @Query('Select * FROM CALORIES')
  Future<List<Calories?>> findDayDataCal();

  //Query #2: INSERT -> this allows to add a kalories in the table
  @insert
  Future<void> insertCalories(Calories calories);

  //Query #3: DELETE -> this allows to delete a kalories from the table
  @delete
  Future<void> deleteCalories(Calories calories);

  //Query #4: UPDATE -> this allows to update a kalories entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCalories(Calories calories);
}//KaloriesDao