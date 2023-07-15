import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class AerobicTime {
  final int value;
  final String dateTime;

  AerobicTime(this.value, this.dateTime);
}