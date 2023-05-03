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
  String? gender;
  String? institutionID;
  String? callUpNumber;
  DateTime? registeredDate;
  String? bankName;
  String? accountNumber;
  String? accountName;
  @Enumerated(EnumType.name)
  late AddHocStaffType staffType;

  @override
  String toString() {
    return '(id: $id, firstname: $firstname, lastname: $lastname, startDate: $startDate, endDate: $endDate, department: $department, unit: $unit, phoneNumber: $phoneNumber, nokName: $nokName, institutionName: $institutionName, courseOfStudy: $courseOfStudy, nokNumber: $nokNumber, nokAddress: $nokAddress, houseAddress: $houseAddress, staffID: $staffID, gender: $gender, institutionID: $institutionID, callUpNumber: $callUpNumber, registeredDate: $registeredDate, bankName: $bankName, accountNumber: $accountNumber, accountName: $accountName, staffType: $staffType)';
  }
}
