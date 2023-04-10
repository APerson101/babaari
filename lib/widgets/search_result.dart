import 'package:babaari/activity/activity_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/adhocstaff.dart';
import 'addhoc_info_view.dart';

class SearchResult extends ConsumerWidget {
  const SearchResult({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search result"),
      ),
      body: ref.watch(findNameMatches(name)).when(
          data: (data) {
            if (data == null || data.isEmpty) {
              return const Center(child: Text("No such names found"));
            }
            var controller = DataGridController();
            return SfDataGrid(
                columnWidthMode: ColumnWidthMode.fill,
                controller: controller,
                selectionMode: SelectionMode.single,
                onSelectionChanged: (selectedRow, _) {
                  // move to the more info page about the person selected
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddHocInfoView(
                            staff: data[controller.selectedIndex],
                          )));
                },
                source: SearchResultDataSource(people: data),
                columns: [
                  GridColumn(columnName: 'id', label: const Text('ID')),
                  GridColumn(columnName: 'type', label: const Text('Type')),
                  GridColumn(
                      columnName: 'first name',
                      label: const Text('First name')),
                  GridColumn(
                      columnName: 'last name', label: const Text('Last Name')),
                ]);
          },
          error: (er, st) =>
              const Center(child: Text("Failed to load, try again")),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive())),
    );
  }
}

class SearchResultDataSource extends DataGridSource {
  SearchResultDataSource({required List<AddHocStaff> people}) {
    data = people
        .map((person) => DataGridRow(cells: [
              DataGridCell(columnName: 'id', value: person.staffID),
              DataGridCell(columnName: 'first name', value: person.firstname),
              DataGridCell(columnName: 'last name', value: person.lastname),
              DataGridCell(
                  columnName: 'type', value: describeEnum(person.staffType)),
            ]))
        .toList();
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
                  child: Text(e.value.toString()),
                ))
            .toList());
  }
}
