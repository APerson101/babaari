import 'package:isar/isar.dart';

part 'department.g.dart';

@collection
class Department {
  String? name;
  List<String>? units;
  Id id = Isar.autoIncrement;
  String? fullName;

  @override
  String toString() => 'Department(name: $name, units: $units, id: $id)';
}
