import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class TotCalDao {
   @Query('SELECT * FROM TOTALCALORIES AT DAY :dateTime')
  Future<TotCal?> findTotCalbyDate(String dateTime);

  @Query('SELECT * FROM TOTALCALORIES')
  Future<List<TotCal>> findAllTotCal();

  @insert
  Future<void> insertTotCal(TotCal totCal);

  @delete
  Future<void> deleteTotCal(TotCal totCal);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTotCal(TotCal totCal);
}