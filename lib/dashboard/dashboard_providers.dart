import 'package:babaari/helpers/database.dart';
import 'package:babaari/models/activity.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/models/department.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../people_view.dart';
import '../widgets/add_view.dart';

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

final deleteStaff =
    FutureProvider.autoDispose.family<void, List<Id>>((ref, id) async {
  var isar = GetIt.I<DatabaseHelper>();
  await isar.deleteStaffs(id);
  ref.watch(isDeletingStaff.notifier).state = DeleteStaffEnum.deleting;
});

final updateDpt =
    StateProvider.autoDispose.family<dynamic, Department>((ref, dpt) async {
  var isar = GetIt.I<DatabaseHelper>();
  var lt = await isar.updateDepartment(dpt);
  ref.invalidate(allDepartments);
  return lt;
});

final deleteDpt = StateProvider((ref) async {
  var isar = GetIt.I<DatabaseHelper>();
  var status = await isar.deleteDepartment(ref.watch(idToDelete));
  ref.invalidate(allDepartments);
  return status;
});

final getStaffActivity =
    FutureProvider.autoDispose.family<List<Activity>, String>((ref, id) async {
  var isar = GetIt.I<Isar>();
  return await isar.activitys.filter().staffIDEqualTo(id).findAll();
});

final getDepartmentStaff = FutureProvider.autoDispose
    .family<List<AddHocStaff>, String>((ref, dpt) async {
  var isar = GetIt.I<Isar>();
  return await isar.addHocStaffs.filter().departmentContains(dpt).findAll();
});
