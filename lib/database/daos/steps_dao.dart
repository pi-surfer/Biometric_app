import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class StepsDao {
  //Query #0: SELECT -> this allows to obtain all the entries of the step table of a certain date
  @Query('SELECT * FROM Steps WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<Steps>> findStepsbyDate(DateTime startTime, DateTime endTime);

  //Query #1: SELECT -> this allows to obtain all the entries of the stap table
  @Query('SELECT * FROM Steps')
  Future<List<Steps>> findAllSteps();

  //@Query('Select * FROM Steps WHERE dateTime')
  //Future<List<Steps?>> findAllDaySteps(DateTime dateTime);
  //@Query('SELECT * FROM CALORIES WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  //Future<List<Calories>> findCaloriesbyDate(DateTime startTime, DateTime endTime);

  //Query #2: INSERT -> this allows to add a step in the table
  @insert
  Future<void> insertSteps(Steps steps);

  //Query #3: DELETE -> this allows to delete a step from the table
  @delete
  Future<void> deleteSteps(Steps steps);

  //Query #4: UPDATE -> this allows to update a step entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateSteps(Steps steps);
}//StepsDao