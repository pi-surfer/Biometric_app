import 'package:floor/floor.dart';


@Entity(primaryKeys: ['dateTime'])
class HR {
  final int value;
  final DateTime dateTime;

  HR(this.value, this.dateTime);
}