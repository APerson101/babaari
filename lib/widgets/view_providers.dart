import 'package:babaari/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/adhocstaff.dart';

part 'view_providers.g.dart';

final List<String> labels = [
  'First name',
  'Last name',
  'Phone number',
  'House Address',
  'Institution',
  'Course',
  'code',
  'Bank Name',
  'Account name',
  'Account number',
  'Department',
  'unit',
  'ID card number',
  'Attachment starting date',
  'Attachment Ending date',
  'Next of kin name',
  'Next of kin Address',
  'Next of kin Number'
];

final nokNameViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.nokName!,
);
final institutionNameViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.institutionName!,
);
final accountNameViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.accountName!,
);
final addressViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.houseAddress!,
);
final nokAddressViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.nokAddress!,
);
final numberViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.phoneNumber!,
);
final nokNumberViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.nokNumber!,
);
final startDateProvider = StateProvider.autoDispose<DateTime?>((ref) => null);
final endDateViewProvider = StateProvider.autoDispose<DateTime?>((ref) => null);
final staffIDViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.staffID!,
);
final codeViewProvider = StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.institutionID!,
);
final accountNumberProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.accountNumber!,
);
final bankNameProvider = StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.bankName!,
);
final departmentNameViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.department!,
);
final unitViewProvider = StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.unit!,
);
final courseViewProvider =
    StateProvider.family.autoDispose<String, AddHocStaff>(
  (ref, staff) => staff.courseOfStudy!,
);

@riverpod
class MultiPrint extends _$MultiPrint {
  @override
  List<List<PrintOptionsCorper>> build() {
    return [[]];
  }

  addItem(PrintOptionsCorper item, int personIndex) {
    state[personIndex] = [...state[personIndex], item];
    state = [...state];
  }

  removeItem(PrintOptionsCorper item, int personindex) {
    state[personindex].remove(item);
    state = [...state];
  }
}

@riverpod
class MultiPrintSiwes extends _$MultiPrintSiwes {
  @override
  List<List<PrintOptonsSiwes>> build() {
    return [[]];
  }

  addItem(PrintOptonsSiwes item, int personIndex) {
    state[personIndex] = [...state[personIndex], item];
    state = [...state];
  }

  removeItem(PrintOptonsSiwes item, int personindex) {
    state[personindex].remove(item);
    state = [...state];
  }
}
