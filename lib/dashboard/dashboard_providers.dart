import 'package:babaari/helpers/database.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/models/department.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

final newPersonAdded = StreamProvider.autoDispose((ref) async* {
  var isar = GetIt.I<Isar>();
  var updatedStaff = isar.addHocStaffs.watchLazy();
  updatedStaff.listen((_) {
    // new person added
    //update corpers count
    ref.invalidate(numberOfCorpers);
    //update siwes count
    ref.invalidate(numberOfSiwes);
    //update latest activity

    //update staff list
    ref.invalidate(allAdhocStaff);
  });
});

final newUnitAdded = AutoDisposeStreamProvider((ref) async* {
  var isar = GetIt.I<Isar>();
  var updatedUnits = isar.units.watchLazy();

  updatedUnits.listen((_) {
    ref.invalidate(allUnits);
  });
});
final newDepartmentAdded = AutoDisposeStreamProvider((ref) async* {
  var isar = GetIt.I<Isar>();
  var updatedDpts = isar.departments.watchLazy();
  updatedDpts.listen((_) {
    ref.invalidate(allDepartments);
  });
});

final numberOfCorpers = FutureProvider.autoDispose<int?>((ref) async {
  var isar = GetIt.I<Isar>();
  return await isar.addHocStaffs
      .filter()
      .staffTypeEqualTo(AddHocStaffType.corper)
      .count();
});
final numberOfSiwes = FutureProvider.autoDispose<int?>((ref) async {
  var isar = GetIt.I<Isar>();
  return await isar.addHocStaffs
      .filter()
      .staffTypeEqualTo(AddHocStaffType.siwes)
      .count();
});

final allAdhocStaff =
    FutureProvider.autoDispose<List<AddHocStaff>?>((ref) async {
  var isar = GetIt.I<Isar>();
  return await isar.addHocStaffs.where().findAll();
});

final allDepartments = AutoDisposeFutureProvider((ref) async {
  var isar = GetIt.I<Isar>();
  return await isar.departments.where().findAll();
});
final allUnits = AutoDisposeFutureProvider((ref) async {
  var isar = GetIt.I<Isar>();
  return await isar.units.where().findAll();
});
