import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class Cal {
  final double value;
  final String dateTime;

  Cal(this.value, this.dateTime);
}