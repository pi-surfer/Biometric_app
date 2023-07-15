import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class TotCal {
  final int value;
  final DateTime dateTime;

  TotCal(this.value, this.dateTime);
}