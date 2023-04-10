import 'package:isar/isar.dart';

part 'activity.g.dart';

@collection
class Activity {
  Id id = Isar.autoIncrement;
  DateTime? created;
  String? staffID;
  String? message;
  @Enumerated(EnumType.name)
  late ActivityType type;
}

enum ActivityType {
  create,
  update,
  delete,
  printmonthlyclearance,
  printsiwesacceptance,
  printfinalclearance,
  printnyscacceptance
}
