import 'dart:math';

import 'package:babaari/dashboard/dashboard_providers.dart';
import 'package:babaari/models/activity.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/models/department.dart';
import 'package:babaari/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'activity/activity_providers.dart';
import 'helpers/database.dart';
import 'widgets/addhoc_info_view.dart';

class PeopleView extends ConsumerWidget {
  const PeopleView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var creator = ref.watch(createPeople);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Corpers and Interns"),
        actions: const [SearchBarWidget()],
      ),
      body: creator.when(data: (_) {
        // show table of everyone
        return Center(child: _PeopleView());
      }, error: (Object error, StackTrace stackTrace) {
        return const Center(child: Text("ERROR"));
      }, loading: () {
        return const CircularProgressIndicator.adaptive();
      }),
    );
  }
}

final createPeople = FutureProvider((ref) async {
  return;
  var isar = GetIt.I<DatabaseHelper>();
  var department = await GetIt.I<Isar>().departments.where().findAll();

  await isar.saveStaff(List.generate(30, (index) {
    var dpt = Random.secure().nextInt(department.length);
    var unitsAll = department[dpt].units;
    return AddHocStaff()
      ..accountName = 'Account Name'
      ..accountNumber = '0123849688'
      ..bankName = 'GTBank'
      ..courseOfStudy = 'Computer Science'
      ..department = department[dpt].name
      ..unit = unitsAll![Random.secure().nextInt(unitsAll.length)]
      ..endDate = DateTime.now()
      ..startDate = DateTime.now()
      ..firstname = 'Abdulhadi'
      ..lastname = 'Hashim'
      ..houseAddress = 'Wuse, Abuja'
      ..phoneNumber = '08159730537'
      ..institutionName = 'Afe Babalola University'
      ..institutionID = 'FC/21C/10200'
      ..nokAddress = 'Amina close'
      ..staffType = AddHocStaffType.values[Random.secure().nextInt(2)]
      ..nokName = 'Sister'
      ..nokNumber = '09124630793'
      ..staffID = '${index + 1}'
      ..registeredDate = DateTime.now();
  }));
});

class _PeopleView extends ConsumerWidget {
  _PeopleView();
  String nameToBeDeleted = "";
  String idToBeDeleted = '';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(isDeletingStaff, (previous, next) {
      next == DeleteStaffEnum.deleting
          ? {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Successfully deleted!"),
                backgroundColor: Colors.green,
              )),
              ref.watch(isDeletingStaff.notifier).state = DeleteStaffEnum.idle,
              ref.watch(addActivity(Activity()
                ..created = DateTime.now()
                ..message = 'Successfully deleted $nameToBeDeleted'
                ..type = ActivityType.delete
                ..staffID = idToBeDeleted))
            }
          : null;
    });
    var controller = DataGridController();

    return ref.watch(allAdhocStaff).when(data: (staff) {
      if (staff == null) {
        return const Center(child: Text("No one added yet"));
      }
      return SfDataGrid(
          allowSorting: true,
          allowColumnsResizing: true,
          allowFiltering: true,
          columnWidthMode: ColumnWidthMode.fill,
          selectionMode: SelectionMode.single,
          controller: controller,
          onSelectionChanged: (selectedRow, _) {
            var selection = controller.selectedIndex;
            controller.selectedIndex = -1;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddHocInfoView(
                      staff: staff[selection],
                    )));
          },
          source: _PeopleDataSource(staff, (id) async {
            await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(
                          "Confirm deleting of ${staff[id].firstname} ${staff[id].lastname}"),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () async {
                              nameToBeDeleted =
                                  "${staff[id].firstname} ${staff[id].lastname}";
                              idToBeDeleted = id.toString();
                              ref.watch(deleteStaff(id));
                              Navigator.of(context).pop();
                            },
                            child: const Text("Continue")),
                      ],
                    ));
          }),
          columns: [
            GridColumn(columnName: 'id', label: const Text('ID')),
            GridColumn(
                columnName: 'firstname', label: const Text('First Name')),
            GridColumn(columnName: 'lastname', label: const Text('Last Name')),
            GridColumn(columnName: 'school', label: const Text('Institution')),
            GridColumn(columnName: 'course', label: const Text('course')),
            GridColumn(columnName: 'dpt', label: const Text('Department')),
            GridColumn(columnName: 'unit', label: const Text('unit')),
            GridColumn(columnName: 'type', label: const Text('type')),
            GridColumn(columnName: 'number', label: const Text('number')),
            GridColumn(columnName: 'Delete', label: const Text('Delete')),
            GridColumn(
                columnName: 'Start Date', label: const Text('Start Date')),
            GridColumn(columnName: 'End Date', label: const Text('End Date')),
            GridColumn(
                columnName: 'Registered',
                label: const Text('Registration Date')),
          ]);
    }, error: (Object error, StackTrace stackTrace) {
      return const Center(child: Text("Error"));
    }, loading: () {
      return const Center(child: CircularProgressIndicator.adaptive());
    });
  }
}

class _PeopleDataSource extends DataGridSource {
  _PeopleDataSource(List<AddHocStaff> staff, this.deletePerson) {
    data = staff
        .map((person) => DataGridRow(cells: [
              DataGridCell(columnName: 'id', value: person.staffID),
              DataGridCell(columnName: 'firstname', value: person.firstname),
              DataGridCell(columnName: 'lastname', value: person.lastname),
              DataGridCell(columnName: 'school', value: person.institutionName),
              DataGridCell(columnName: 'course', value: person.courseOfStudy),
              DataGridCell(columnName: 'dpt', value: person.department),
              DataGridCell(columnName: 'unit', value: person.unit),
              DataGridCell(
                  columnName: 'type', value: describeEnum(person.staffType)),
              DataGridCell(columnName: 'number', value: person.phoneNumber),
              DataGridCell(columnName: 'Delete', value: person.id),
              DataGridCell(
                  columnName: 'Start Date',
                  value: DateFormat.yMEd().format(person.startDate!)),
              DataGridCell(
                  columnName: 'End Date',
                  value: DateFormat.yMEd().format(person.endDate!)),
              DataGridCell(
                  columnName: 'Registered',
                  value: DateFormat.yMEd()
                      .add_Hms()
                      .format(person.registeredDate!)),
            ]))
        .toList();
  }
  List<DataGridRow> data = [];
  @override
  List<DataGridRow> get rows => data;
  void Function(int) deletePerson;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return Container(
        alignment: Alignment.center,
        child: e.columnName == 'Delete'
            ? ElevatedButton(
                onPressed: () => deletePerson(e.value),
                child: const Text('del'))
            : Text(e.value.toString()),
      );
    }).toList());
  }
}

final isDeletingStaff = StateProvider((ref) => DeleteStaffEnum.idle);

enum DeleteStaffEnum { idle, deleting, done }
