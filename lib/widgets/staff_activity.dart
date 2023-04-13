import 'package:babaari/dashboard/dashboard_providers.dart';
import 'package:babaari/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StaffActivity extends ConsumerWidget {
  const StaffActivity({super.key, required this.staffID});
  final String staffID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getStaffActivity(staffID)).when(
      data: (data) {
        return SfDataGrid(
            allowSorting: true,
            allowMultiColumnSorting: true,
            columnWidthMode: ColumnWidthMode.fill,
            source: _StaffActivitySource(people: data),
            columns: [
              GridColumn(columnName: 'Type', label: const Text("Type")),
              GridColumn(columnName: 'Date', label: const Text("Date")),
            ]);
      },
      error: (Object error, StackTrace stackTrace) {
        return const Center(
          child: Text("Error when loading activities"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}

class _StaffActivitySource extends DataGridSource {
  _StaffActivitySource({required List<Activity> people}) {
    data = people.map((person) {
      String type = '';
      switch (person.type) {
        case ActivityType.create:
          type = 'User creation';
          break;
        case ActivityType.update:
          type = 'User Updated';

          break;
        case ActivityType.delete:
          type = 'User Deleted';

          break;
        case ActivityType.printmonthlyclearance:
          type = 'Monthly Clearance letter printed';

          break;
        case ActivityType.printAcceptanceLetter:
          type = 'Acceptance letter printed';

          break;
        case ActivityType.printfinalclearance:
          type = 'Final Clearance printed';

          break;
        case ActivityType.siwesCompletion:
          type = 'SIWES completion letter printed';
          break;
        case ActivityType.departmentPosting:
          type = 'Department posting letter printed';
          break;
      }
      return DataGridRow(cells: [
        DataGridCell(columnName: 'Type', value: type),
        DataGridCell(
            columnName: 'Date',
            value: DateFormat.yMd().add_Hm().format(person.created!)),
      ]);
    }).toList();
  }
  List<DataGridRow> data = [];
  @override
  List<DataGridRow> get rows => data;
  @override
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return Container(
        alignment: Alignment.center,
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
