import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class HeartRatesDao {
   @Query('SELECT * FROM HR WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<HR>> findHeartRatesbyDate(String startTime, String endTime);

  @Query('SELECT * FROM HR')
  Future<List<HR>> findAllHeartRates();

  @insert
  Future<void> insertHeartRate(HR heartRates);

  @delete
  Future<void> deleteHeartRate(HR heartRates);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateHeartRate(HR heartRates);
}//HeartRatesDao