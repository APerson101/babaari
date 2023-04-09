import 'package:isar/isar.dart';

part 'department.g.dart';

@collection
class Department {
  String? name;
  Id id = Isar.autoIncrement;
}

@collection
class Unit {
  String? name;
  Id id = Isar.autoIncrement;
}
