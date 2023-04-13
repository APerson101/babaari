import 'package:babaari/models/activity.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

final getAllActivity = FutureProvider.autoDispose((ref) async {
  var db = GetIt.I<Isar>();
  return await db.activitys.where().findAll();
});

final todayActivities = AutoDisposeFutureProvider((ref) async {
  var isar = GetIt.I<Isar>();
  return await isar.activitys
      .filter()
      .createdGreaterThan(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day))
      .findAll();
});

final todayActivitesUpdater = StreamProvider.autoDispose((ref) async* {
  var isar = GetIt.I<Isar>();
  var updatedActivity = isar.activitys.watchLazy();
  updatedActivity.listen((_) {
    //update latest activity
    ref.invalidate(todayActivities);
    ref.invalidate(getAllActivity);
  });
});

final findNameMatches = FutureProvider.family
    .autoDispose<List<AddHocStaff>?, String>((ref, text) async {
  var db = GetIt.I<Isar>();
  debugPrint('looking for name: $text');
  var firstNameMatches = await db.addHocStaffs
      .filter()
      .firstnameContains(text, caseSensitive: false)
      .findAll();
  var lastNameMatches = await db.addHocStaffs
      .filter()
      .lastnameContains(text, caseSensitive: false)
      .findAll();
  return List.from(firstNameMatches)..addAll(lastNameMatches);
});

final addActivity =
    FutureProvider.family.autoDispose<void, Activity>((ref, activity) async {
  var isar = GetIt.I<Isar>();
  await isar.writeTxn(() async => await isar.activitys.put(activity));
  return;
});
final addActivities = FutureProvider.family
    .autoDispose<void, List<Activity>>((ref, activity) async {
  var isar = GetIt.I<Isar>();
  await isar.writeTxn(() async => await isar.activitys.putAll(activity));
  return;
});
