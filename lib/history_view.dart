import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'activity/activity_providers.dart';
import 'models/activity.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activititesHistory = ref.watch(getAllActivity);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Activities History"),
      ),
      body: activititesHistory.when(
          data: (activities) {
            return _DataTable(activities);
          },
          error: (er, st) => const Center(child: Text("Failed to load")),
          loading: () => const CircularProgressIndicator.adaptive()),
    );
  }
}

class _DataTable extends ConsumerWidget {
  const _DataTable(this.activities);
  final List<Activity> activities;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SfDataGrid(source: _ActivityDataSource(activities), columns: [
      GridColumn(columnName: 'ID', label: const Text('ID')),
      GridColumn(columnName: 'Date', label: const Text('Date')),
      GridColumn(columnName: 'addHoc ID', label: const Text('AddHoc ID')),
      GridColumn(columnName: 'Activity', label: const Text('Activity Type')),
    ]);
  }
}

class _ActivityDataSource extends DataGridSource {
  _ActivityDataSource(List<Activity> activities) {
    activities.map((activity) => data.add(DataGridRow(cells: [
          DataGridCell(columnName: 'ID', value: activity.id),
          DataGridCell(
              columnName: 'Date',
              value: DateFormat.yMd().add_jms().format(activity.created!)),
          DataGridCell(columnName: 'addHoc ID', value: activity.staffID ?? '-'),
          DataGridCell(
              columnName: 'Activity', value: describeEnum(activity.type)),
        ])));
  }
  List<DataGridRow> data = [];

  @override
  List<DataGridRow> get rows => data;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row
            .getCells()
            .map((e) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(e.value.toString())))
            .toList());
  }
}
