import 'package:babaari/forms/current_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../models/adhocstaff.dart';

class DatabaseHelper {
  Isar isar;

  DatabaseHelper() : isar = GetIt.I<Isar>();
  saveForms(FormModes type, List data) async {
    debugPrint('saving the data...');

    List<AddHocStaff> list = [];
    for (var entry in data) {
      list.add(entry as AddHocStaff);
    }
    return await _saveStaff(list);
  }

  _saveStaff(List<AddHocStaff> staff) async {
    isar.writeTxn(() async {
      isar.addHocStaffs.putAll(staff);
    });
    return true;
  }
}

enum AddHocStaffType { siwes, corper }
