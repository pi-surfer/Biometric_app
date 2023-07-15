import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class TotSteps {
  final int value;
  final DateTime dateTime;

  TotSteps(this.value, this.dateTime);
}