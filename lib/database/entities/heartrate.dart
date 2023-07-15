import 'package:floor/floor.dart';

//Here, we are saying to floor that this is a class that defines an entity
@Entity(primaryKeys: ['id'])
class HR {
  final int? id;
  final int value;
  final DateTime dateTime;
  //Default constructor
  HR(this.id, this.value, this.dateTime);
} //HeartRates