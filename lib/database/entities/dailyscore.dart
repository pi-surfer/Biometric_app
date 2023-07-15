import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class DailyScore {
  final int value;
  final DateTime dateTime;

  DailyScore(this.value, this.dateTime);
}