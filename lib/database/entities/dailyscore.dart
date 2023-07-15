import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class DailyScore {
  final int value;
  final String dateTime;

  DailyScore(this.value, this.dateTime);
}