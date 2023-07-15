import 'package:floor/floor.dart';

//Here, we are saying to floor that this is a class that defines an entity
@Entity(primaryKeys: ['id'])
class Calories{
  final int? id;
  final double value;
  final DateTime dateTime;
  //Default constructor
  Calories(this.id, this.value, this.dateTime);
} //HeartRates