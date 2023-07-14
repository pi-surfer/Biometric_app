import 'package:floor/floor.dart';


@Entity(primaryKeys: ['id'])
class Steps {
  final int? id;
  final int value;
  final DateTime dateTime;

  Steps(this.id, this.value, this.dateTime);
}