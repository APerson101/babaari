import 'package:babaari/dashboard/add_person_view.dart';
import 'package:babaari/widgets/view_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/dashboard_providers.dart';
import '../models/adhocstaff.dart';
import '../widgets/widgets.dart';
import 'current_form_view.dart';

class AddHocForm extends ConsumerWidget {
  AddHocForm({super.key, required this.addHocStaff, required this.formMode});
  final AddHocStaff addHocStaff;
  final FormModes formMode;
  final List<TextEditingController> _controllers =
      List.generate(18, (index) => TextEditingController());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dpts = ref.watch(allDepartments);
    return dpts.maybeWhen(data: (data) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: EditableLabel(
                  controller: _controllers[0],
                  label: labels[0],
                  isEditing: true,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: EditableLabel(
                  controller: _controllers[1],
                  label: labels[1],
                  isEditing: true,
                ),
              ),
            ]),
            ...List.generate(_controllers.length - 2, (index) {
              if (index == 8) {
                return DropdownButton(
                    value: ref.watch(_selectedDpt),
                    items: data
                        .map((e) => DropdownMenuItem(
                            value: data.indexOf(e), child: Text(e.name ?? "")))
                        .toList(),
                    onChanged: (selected) {
                      if (selected != null) {
                        _controllers[10].text = data[selected].name!;
                        ref.watch(_selectedDpt.notifier).state = selected;
                      }
                    });
              }
              if (index == 9) {
                var department = data[ref.watch(_selectedDpt)];
                return DropdownButton(
                    value: ref.watch(_selectedUnit),
                    items: department.units!
                        .map((e) => DropdownMenuItem(
                            value: department.units?.indexOf(e),
                            child: Text(e)))
                        .toList(),
                    onChanged: (selected) {
                      if (selected != null) {
                        _controllers[11].text = department.units![selected];
                        ref.watch(_selectedUnit.notifier).state = selected;
                      }
                    });
              } else {
                var num = index + 2;
                var label = index == 4
                    ? ref.watch(selectedTab) == 0
                        ? "State Code"
                        : "School ID"
                    : labels[num];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: EditableLabel(
                      isEditing: true,
                      controller: _controllers[num],
                      label: label),
                );
              }
            })
          ],
        ),
      );
    }, orElse: () {
      return const CircularProgressIndicator.adaptive();
    });
  }
}

final _selectedDpt = StateProvider((ref) => 0);
final _selectedUnit = StateProvider((ref) => 0);
