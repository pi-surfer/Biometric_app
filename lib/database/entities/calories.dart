import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class Cal {
  final int value;
  final DateTime dateTime;

  Cal(this.value, this.dateTime);
}