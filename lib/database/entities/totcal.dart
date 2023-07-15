import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class TotCal {
  final double value;
  final String dateTime;

  TotCal(this.value, this.dateTime);
}