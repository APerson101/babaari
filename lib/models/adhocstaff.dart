import 'package:isar/isar.dart';

import '../helpers/database.dart';

part 'adhocstaff.g.dart';

@collection
class AddHocStaff {
  Id id = Isar.autoIncrement;
  String? firstname;
  String? lastname;
  DateTime? startDate;
  DateTime? endDate;
  String? department;
  String? unit;
  String? phoneNumber;
  String? nokName;
  String? institutionName;
  String? courseOfStudy;
  String? nokNumber;
  String? nokAddress;
  String? houseAddress;
  String? staffID;
  String? institutionID;
  DateTime? registeredDate;
  String? bankName;
  String? accountNumber;
  String? accountName;
  @Enumerated(EnumType.name)
  late AddHocStaffType staffType;
}
