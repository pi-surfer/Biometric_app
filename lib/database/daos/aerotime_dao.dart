import 'package:floor/floor.dart';
import 'package:app_project/database/entities/entities.dart';

@dao
abstract class AerobicTimeDao {
  
  @Query('SELECT * FROM AEROBICTIME WHERE dateTime between :startTime and :endTime ORDER BY dateTime ASC')
  Future<List<AerobicTime>> findAerobicTimebyDate(DateTime startTime, DateTime endTime);

  @Query('SELECT * FROM HR')
  Future<List<AerobicTime>> findAllAerobicTime();

  @insert
  Future<void> insertAerobicTime(AerobicTime aerobicTime);

  @delete
  Future<void> deleteAerobicTime(AerobicTime aerobicTime);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateAerobicTime(AerobicTime aerobicTime);
}