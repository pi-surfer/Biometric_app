import 'package:floor/floor.dart';


@Entity(primaryKeys: ['id'])
class Cal {
  final int? id;
  final int value;
  final DateTime dateTime;

  Cal(this.id, this.value, this.dateTime);
}