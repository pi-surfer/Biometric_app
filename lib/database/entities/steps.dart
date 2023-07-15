import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class Steps {
  final int value;
  final DateTime dateTime;

  Steps(this.value, this.dateTime);
}