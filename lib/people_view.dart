import 'dart:math';

import 'package:babaari/dashboard/dashboard_providers.dart';
import 'package:babaari/models/activity.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/models/department.dart';
import 'package:babaari/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return creator.when(
        data: (val) => Center(child: _PeopleView()),
        error: (Object error, StackTrace stackTrace) {
          return const Text("");
        },
        loading: () {
          return const CircularProgressIndicator.adaptive();
        });
  }
}

final createPeople = FutureProvider((ref) async {
  return;
  var isar = GetIt.I<DatabaseHelper>();
  var department = await GetIt.I<Isar>().departments.where().findAll();

  await isar.saveStaff(List.generate(30, (index) {
    var dpt = Random.secure().nextInt(department.length);
    var unitsAll = department[dpt].units;

    var univesities = [
      'Abia State University',
      'Abubakar Tafawa Balewa University',
      'Achievers University',
      'Adamawa State University',
      'Adekunle Ajasin University',
      'Adeleke University	Osun',
      'Afe Babalola University',
      'Ahmadu Bello University',
      'Ajayi Crowther University',
      'Akwa Ibom State University',
      'Al-Hikmah University',
      'Ambrose Alli University',
      'American University of Nigeria',
    ];
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
      ..institutionName =
          univesities[Random.secure().nextInt(univesities.length)]
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
  List<String> nameToBeDeleted = [""];
  List<String> idToBeDeleted = [''];
  final controller = DataGridController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndexes = [];

    ref.listen(isDeletingStaff, (previous, next) {
      if (next == DeleteStaffEnum.deleting) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Successfully deleted!"),
          backgroundColor: Colors.green,
        ));
        var activitiesList = <Activity>[];

        ref.watch(isDeletingStaff.notifier).state = DeleteStaffEnum.idle;
        int count = 0;
        for (var name in nameToBeDeleted) {
          activitiesList.add(Activity()
            ..created = DateTime.now()
            ..message = 'Successfully deleted $name'
            ..type = ActivityType.delete
            ..staffID = idToBeDeleted[count]);
        }
        count += 1;
        ref.watch(addActivities(activitiesList));
      }
    });

    return ref.watch(allAdhocStaff).when(data: (staff) {
      if (staff == null || staff.isEmpty) {
        return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text("No one added yet")));
      }

      return Scaffold(
          appBar: AppBar(
            title: const Text("All Corpers and Interns"),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                      child: const Text(
                        "Print",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (selectedIndexes.isEmpty) {
                          await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Nothing selected!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"))
                                    ],
                                  ));
                          return;
                        } else {
                          List<AddHocStaff> toPrint = [];
                          for (var index in selectedIndexes) {
                            toPrint.add(staff
                                .firstWhere((element) => element.id == index));
                          }

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return MultiPrintDailogWidget(staff: toPrint);
                          }));
                        }
                      }),
                  TextButton(
                      onPressed: () async {
                        if (selectedIndexes.isEmpty) {
                          await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Nothing selected!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"))
                                    ],
                                  ));
                          return;
                        } else {
                          await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        "Confirm deleting of ${selectedIndexes.length} person(s)"),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                          onPressed: () async {
                                            var staffToBeDeleted = <Id>[];
                                            for (var id in selectedIndexes) {
                                              var tdb = staff.firstWhere(
                                                  (element) =>
                                                      element.id == id);
                                              nameToBeDeleted.add(
                                                  "${tdb.firstname} ${tdb.lastname}");
                                              idToBeDeleted
                                                  .add(tdb.id.toString());

                                              staffToBeDeleted.add(id);
                                              debugPrint(
                                                  "Staff id to be deleted is: $id");
                                            }
                                            // return;
                                            ref.watch(
                                                deleteStaff(staffToBeDeleted));
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Continue")),
                                    ],
                                  ));
                        }
                      },
                      child: const Text(
                        "delete selected",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () async {
                        if (selectedIndexes.isEmpty) {
                          await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Nothing selected!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"))
                                    ],
                                  ));
                          return;
                        }
                        String addDetails =
                            's/n     AccountName     AccountNumber     BankName\n';
                        int count = 1;
                        for (var index in selectedIndexes) {
                          addDetails +=
                              '$count     ${staff[index - 1].accountName!}     ${staff[index - 1].accountNumber}     ${staff[index - 1].bankName}\n';
                          count += 1;
                        }
                        await Clipboard.setData(
                            ClipboardData(text: addDetails));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).clearSnackBars();

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Copied to clipboard!")));
                        }
                      },
                      child: const Text(
                        "copy account ",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SearchBarWidget(),
            ],
          ),
          body: SfDataGrid(
              showCheckboxColumn: true,
              allowSorting: true,
              allowColumnsResizing: true,
              allowMultiColumnSorting: true,
              allowTriStateSorting: true,
              isScrollbarAlwaysShown: true,
              rowsPerPage: 40,
              columnWidthMode: ColumnWidthMode.auto,
              selectionMode: SelectionMode.multiple,
              controller: controller,
              onCellTap: (cell) {
                debugPrint(
                    'rowIndex is ${cell.rowColumnIndex.rowIndex.toString()}');
                if (cell.rowColumnIndex.columnIndex == 3 &&
                    cell.rowColumnIndex.rowIndex != 0) {
                  controller.selectedIndex = cell.rowColumnIndex.rowIndex - 1;
                  var id = controller.selectedRow!.getCells()[0].value;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddHocInfoView(
                            staff:
                                staff.firstWhere((element) => element.id == id),
                          )));
                }
              },
              onSelectionChanged: (selectedRow, _) async {
                if (controller.selectedIndex == -1) {
                  selectedIndexes = [];
                } else {
                  debugPrint('seleted index is ${controller.selectedIndex}');
                  var emptyList = <int>[];
                  for (var item in controller.selectedRows) {
                    emptyList.add(item.getCells()[0].value);
                  }
                  selectedIndexes = emptyList;
                }
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Selected: ${selectedIndexes.length.toString()}")));
              },
              source: _PeopleDataSource(staff, (id) async {}),
              columns: [
                GridColumn(
                    columnName: 'uniqueID',
                    label: const Center(child: Text('s/n'))),
                GridColumn(
                    columnName: 'id',
                    label: const Center(child: Text('Tag ID'))),
                GridColumn(
                    columnName: 'firstname',
                    label: const Center(child: Text('First Name'))),
                GridColumn(
                    columnName: 'lastname',
                    label: const Center(child: Text('Last Name'))),
                GridColumn(
                    columnName: 'Institution',
                    label: const Center(child: Text('Institution'))),
                GridColumn(
                    columnName: 'course',
                    label: const Center(child: Text('course'))),
                GridColumn(
                    columnName: 'type',
                    label: const Center(child: Text('type'))),
                GridColumn(
                    columnName: 'Department',
                    label: const Center(child: Text('Department'))),
                GridColumn(
                    columnName: 'Start Date',
                    label: const Center(child: Text('Start Date'))),
                GridColumn(
                    columnName: 'End Date',
                    label: const Center(child: Text('End Date'))),
                GridColumn(
                    columnName: 'Registered',
                    label: const Center(child: Text('Registration Date'))),
              ]));
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
              DataGridCell(columnName: 'uniqueID', value: person.id),
              DataGridCell(columnName: 'id', value: person.staffID),
              DataGridCell(columnName: 'firstname', value: person.firstname),
              DataGridCell(columnName: 'lastname', value: person.lastname),
              DataGridCell(
                  columnName: 'Institution', value: person.institutionName),
              DataGridCell(columnName: 'course', value: person.courseOfStudy),
              DataGridCell(
                  columnName: 'type', value: describeEnum(person.staffType)),
              DataGridCell(columnName: 'Department', value: person.department),
              DataGridCell(
                  columnName: 'Start Date',
                  value: DateFormat('EEE d/MMM/y').format(person.startDate!)),
              DataGridCell(
                  columnName: 'End Date',
                  value: DateFormat('EEE d/MMM/y').format(person.endDate!)),
              DataGridCell(
                  columnName: 'Registered', value: person.registeredDate!),
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
        child: e.columnName == 'Registered'
            ? Text(DateFormat('EEE d/MMM/y').add_Hm().format(e.value))
            : Text(
                e.value.toString(),
                overflow: TextOverflow.ellipsis,
              ),
      );
    }).toList());
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    switch (sortColumn.name) {
      case 'id':
        var aID = int.parse(a?.getCells()[1].value);
        var bID = int.parse(b?.getCells()[1].value);
        var sign = aID > bID
            ? 1
            : aID < bID
                ? -1
                : 0;
        if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
          return sign;
        } else {
          return sign == 1
              ? -1
              : sign == -1
                  ? 1
                  : 0;
        }

      case 'Registered':
        DateTime start = a
            ?.getCells()
            .firstWhere((element) => element.columnName == 'Registered')
            .value;
        DateTime end = b
            ?.getCells()
            .firstWhere((element) => element.columnName == 'Registered')
            .value;

        var value = start.compareTo(end);
        if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
          return value;
        } else {
          return value > 0
              ? -1
              : value < 0
                  ? 1
                  : 0;
        }

      case 'type':
        String aType = a
            ?.getCells()
            .firstWhere((element) => element.columnName == 'type')
            .value;
        String bType = b
            ?.getCells()
            .firstWhere((element) => element.columnName == 'type')
            .value;

        var value = aType.compareTo(bType);
        if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
          return value;
        } else {
          return value > 0
              ? -1
              : value < 0
                  ? 1
                  : 0;
        }

      default:
        return super.compare(a, b, sortColumn);
    }
  }
}

final isDeletingStaff = StateProvider((ref) => DeleteStaffEnum.idle);

enum DeleteStaffEnum { idle, deleting, done }
