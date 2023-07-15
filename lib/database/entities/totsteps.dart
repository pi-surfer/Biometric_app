import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class TotSteps {
  final int value;
  final String dateTime;

  TotSteps(this.value, this.dateTime);
}