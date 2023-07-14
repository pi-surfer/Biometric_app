import 'package:floor/floor.dart';


@Entity(primaryKeys: ['id'])
class HR {
  final int? id;
  final int value;
  final DateTime dateTime;

  HR(this.id, this.value, this.dateTime);
}