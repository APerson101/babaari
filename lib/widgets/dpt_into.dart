import 'package:babaari/dashboard/dashboard_providers.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/addhoc_info_view.dart';
import 'package:babaari/widgets/print_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DPTinfoView extends ConsumerWidget {
  const DPTinfoView({super.key, required this.departmentName});
  final String departmentName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$departmentName details'),
      ),
      body: ref.watch(getDepartmentStaff(departmentName)).when(data: (data) {
        var controller = DataGridController();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SfDataGrid(
                selectionMode: SelectionMode.single,
                onCellTap: (cellDets) {
                  if (cellDets.column.columnName == 'print' &&
                      cellDets.rowColumnIndex.rowIndex != 0) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PrintView(
                        person: data[cellDets.rowColumnIndex.rowIndex - 1],
                      );
                    }));
                  } else if (cellDets.rowColumnIndex.rowIndex != 0) {
                    var sel = controller.selectedIndex;
                    controller.selectedIndex = -1;
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AddHocInfoView(
                          staff: data[cellDets.rowColumnIndex.rowIndex - 1]);
                    }));
                  }
                },
                source: DptSource(staff: data),
                controller: controller,
                columns: [
                  GridColumn(
                      columnName: 'Tag Number',
                      label: const Text("Tag Number")),
                  GridColumn(columnName: 'Unit', label: const Text("Unit")),
                  GridColumn(columnName: 'Name', label: const Text("Name")),
                  GridColumn(columnName: 'Type', label: const Text("Type")),
                  GridColumn(
                      columnName: 'print', label: const Text("Print Letter")),
                ]),
          ),
        );
      }, error: (er, st) {
        return const Center(child: Text("Failed to laod, try again later"));
      }, loading: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}

class DptSource extends DataGridSource {
  List<DataGridRow> data = [];

  DptSource({required List<AddHocStaff> staff}) {
    data = staff
        .map((e) => DataGridRow(cells: [
              DataGridCell(columnName: 'Tag Number', value: e.staffID),
              DataGridCell(columnName: 'Unit', value: e.unit),
              DataGridCell(
                  columnName: 'Name', value: '${e.firstname} ${e.lastname}'),
              DataGridCell(
                  columnName: 'Type', value: describeEnum(e.staffType)),
              const DataGridCell(columnName: 'print', value: 'print'),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => data;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row
            .getCells()
            .map((e) => e.columnName == 'print'
                ? DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text(e.value.toString())))
                : Text(e.value))
            .toList());
  }
}
