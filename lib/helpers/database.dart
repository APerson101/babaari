import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/activity.dart';
import '../models/adhocstaff.dart';
import '../models/department.dart';

class DatabaseHelper {
  Isar isar;

  DatabaseHelper() : isar = GetIt.I<Isar>();

  updateStaff(AddHocStaff person) async {
    await isar.writeTxn(() async {
      await isar.addHocStaffs.put(person);
    });
    await _saveNamesCSV([person]);
    await _saveSchools([person]);
  }

  saveForms(List data) async {
    debugPrint('saving the data...');

    List<AddHocStaff> list = [];
    for (var entry in data) {
      list.add((entry as AddHocStaff)..registeredDate = DateTime.now());
      debugPrint(entry.toString());
    }
    await _saveStaff(list);

    saveActivity(List.generate(
        list.length,
        (index) => Activity()
          ..created = DateTime.now()
          ..type = ActivityType.create
          ..staffID = list[index].staffID
          ..message =
              'New ${describeEnum(list[index].staffType)} added: ${list[index].firstname} ${list[index].lastname}'));
  }

  _saveStaff(List<AddHocStaff> staff) async {
    await isar.writeTxn(() async {
      await isar.addHocStaffs.putAll(staff);
    });
    await _saveNamesCSV(staff);
    await _saveSchools(staff);
    return true;
  }

  saveActivity(List<Activity> activities) async {
    await isar.writeTxn(() async {
      await isar.activitys.putAll(activities);
    });
  }

  _saveNamesCSV(List<AddHocStaff> people) async {
    var names = List.generate(people.length, (index) => people[index].firstname)
      ..addAll(people.map((e) => e.lastname));
    names = names.toSet().toList();
    var currentCSV = await loadCSVNames();
    if (names.isNotEmpty) {
      for (var name in names) {
        currentCSV.add(name!);
      }
    }
    String allNamesCSV = '';
    for (var name in currentCSV) {
      allNamesCSV += '$name ';
    }
    (await File('${(await getApplicationDocumentsDirectory()).path}/names.txt')
        .writeAsString(allNamesCSV.toLowerCase()));
    return true;
  }

  _saveSchools(List<AddHocStaff> people) async {
    var schools =
        List.generate(people.length, (index) => people[index].institutionName);
    schools = schools.toSet().toList();
    var currentCSV = await loadCSVSchool();
    if (schools.isNotEmpty) {
      for (var school in schools) {
        currentCSV.add(school!);
      }
    }
    String allSchoolsCSV = '';
    for (var school in currentCSV) {
      allSchoolsCSV += '$school,';
    }
    (await File(
            '${(await getApplicationDocumentsDirectory()).path}/schools.txt')
        .writeAsString(allSchoolsCSV.toLowerCase()));
    return true;
  }

  saveStaff(dynamic staff) async {
    await clearStaff();
    // await Future.delayed(const Duration(seconds: 2));
    await clearSuggestions();
    await clearSchoolSuggestions();
    // await Future.delayed(const Duration(seconds: 2));
    await _saveStaff(staff);
    // await _saveSchools(staff);
  }

  clearStaff() async {
    await isar.writeTxn(() async {
      await isar.clear();
      // await isar.addHocStaffs.clear();
    });
  }

  deleteStaffs(List<Id> id) async {
    var status = await isar.writeTxn(() async {
      return await isar.addHocStaffs.deleteAll(id);
    });

    debugPrint('status of deleting is: $id is: $status');
    return status;
  }

  updateDepartment(Department dpt) async {
    return await isar.writeTxn(() async {
      return await isar.departments.put(dpt);
    });
  }

  Future<List<String>> loadCSVNames() async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      directory = await directory.create();
      var file =
          await File('${directory.path}/names.txt').create(recursive: true);
      var string = await file.readAsString();
      var splitted = string.split(' ')..removeWhere((element) => element == '');
      return splitted;
    } catch (e) {
      debugPrint(e.toString());
      return [''];
    }
  }

  Future<List<String>> loadCSVSchool() async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      directory = await directory.create();
      var file =
          await File('${directory.path}/schools.txt').create(recursive: true);
      var string = await file.readAsString();
      var splitted = string.split(',')..removeWhere((element) => element == '');
      return splitted;
    } catch (e) {
      debugPrint(e.toString());
      return [''];
    }
  }

  clearSuggestions() async {
    (await File('${(await getApplicationDocumentsDirectory()).path}/names.txt')
        .delete());
  }

  clearSchoolSuggestions() async {
    (await File(
            '${(await getApplicationDocumentsDirectory()).path}/schools.txt')
        .delete());
  }

  Future<bool> deleteDepartment(Id dpt) async {
    debugPrint('deleting $dpt');
    return await isar.writeTxn(() async {
      var status = await isar.departments.delete(dpt);
      return status;
    });
  }
}

enum AddHocStaffType { siwes, corper }
