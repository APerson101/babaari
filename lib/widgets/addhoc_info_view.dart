import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/staff_activity.dart';
import 'package:babaari/widgets/view_providers.dart';
import 'package:babaari/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../helpers/database.dart';

class AddHocInfoView extends ConsumerWidget {
  const AddHocInfoView({super.key, required this.staff});
  final AddHocStaff staff;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editButton = ref.watch(isEditing);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('${staff.firstname} ${staff.lastname}'),
        actions: [
          TextButton(
              onPressed: () {
                ref.watch(isEditing.notifier).state = !ref.watch(isEditing);
                ref.watch(isEditing)
                    ? ref.watch(saveButtonPressed.notifier).state = false
                    : ref.watch(saveButtonPressed.notifier).state = true;
              },
              child: Text(
                editButton ? "save" : "edit",
                style: const TextStyle(color: Colors.white),
              )),
          ref.watch(isEditing)
              ? TextButton(
                  onPressed: () {
                    ref.watch(saveButtonPressed.notifier).state = false;
                    ref.watch(isEditing.notifier).state = false;
                  },
                  child: const Text(
                    "cancel",
                    style: TextStyle(color: Colors.white),
                  ))
              : const SizedBox()
        ],
      ),
      body: _StaffInfo(staff),
    );
  }
}

class _StaffInfo extends ConsumerWidget {
  _StaffInfo(this.staff);
  final AddHocStaff staff;

  final List<TextEditingController> _controllers =
      List.generate(18, (index) => TextEditingController());
  final _key = GlobalKey<FormState>();
  final db = GetIt.I<DatabaseHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var editing = ref.watch(isEditing);

    ref.listen(saveButtonPressed, (pr, nx) async {
      if (pr != nx && nx) {
        if (!validate()) {
          return;
        }
        staff.firstname = _controllers[0].text;
        staff.lastname = _controllers[1].text;
        staff.phoneNumber = _controllers[2].text;
        staff.houseAddress = _controllers[3].text;
        staff.institutionName = _controllers[4].text;
        staff.courseOfStudy = _controllers[5].text;
        staff.institutionID = _controllers[6].text;
        staff.bankName = _controllers[7].text;
        staff.accountName = _controllers[8].text;
        staff.accountNumber = _controllers[9].text;
        staff.department = _controllers[10].text;
        staff.unit = _controllers[11].text;
        staff.staffID = _controllers[12].text;
        staff.startDate = ref.watch(startDateProvider);
        staff.startDate = ref.watch(endDateViewProvider);
        staff.nokName = _controllers[15].text;
        staff.nokAddress = _controllers[16].text;
        staff.nokNumber = _controllers[17].text;
        await db.updateStaff(staff);

        //invalidate suggestions
        ref.invalidate(loadNames);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green, content: Text("SUCCESS!")));
        }
      }
    });
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      child: EditableLabel(
                        label: labels[0],
                        data: staff.firstname!,
                        isEditing: editing,
                        controller: _controllers[0]..text = staff.firstname!,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: EditableLabel(
                      label: labels[1],
                      data: staff.lastname!,
                      isEditing: editing,
                      controller: _controllers[1]..text = staff.lastname!,
                    ))
                  ])),
              EditableLabel(
                label: labels[2],
                data: staff.phoneNumber!,
                isEditing: editing,
                controller: _controllers[2]..text = staff.phoneNumber!,
              ),
              EditableLabel(
                label: labels[3],
                data: staff.houseAddress!,
                isEditing: editing,
                controller: _controllers[3]..text = staff.houseAddress!,
              ),
              Row(
                children: [
                  // INSTITUTION
                  Expanded(
                    child: EditableLabel(
                      label: labels[4],
                      data: staff.institutionName!,
                      isEditing: editing,
                      controller: _controllers[4]
                        ..text = staff.institutionName!,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: EditableLabel(
                      label: labels[5],
                      data: staff.courseOfStudy!,
                      isEditing: editing,
                      controller: _controllers[5]..text = staff.courseOfStudy!,
                    ),
                  ),
                ],
              ),
              EditableLabel(
                label: staff.staffType == AddHocStaffType.corper
                    ? 'State Code'
                    : "School ID",
                data: staff.institutionID!,
                isEditing: editing,
                controller: _controllers[6]..text = staff.institutionID!,
              ),
              EditableLabel(
                label: labels[7],
                data: staff.bankName ?? '-',
                isEditing: editing,
                controller: _controllers[7]..text = staff.bankName ?? '-',
              ),
              Row(
                children: [
                  Expanded(
                    child: EditableLabel(
                      label: labels[8],
                      data: staff.accountName ?? '-',
                      isEditing: editing,
                      controller: _controllers[8]
                        ..text = staff.accountName ?? '-',
                    ),
                  ),
                  Expanded(
                    child: EditableLabel(
                      label: labels[9],
                      data: staff.accountNumber ?? '-',
                      isEditing: editing,
                      controller: _controllers[9]
                        ..text = staff.accountNumber ?? '-',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: EditableLabel(
                      label: labels[10],
                      data: staff.department ?? '-',
                      isEditing: editing,
                      controller: _controllers[10]
                        ..text = staff.department ?? '-',
                    ),
                  ),
                  Expanded(
                    child: EditableLabel(
                      label: labels[11],
                      data: staff.unit ?? '-',
                      isEditing: editing,
                      controller: _controllers[11]..text = staff.unit ?? '-',
                    ),
                  ),
                  Expanded(
                    child: EditableLabel(
                      label: labels[12],
                      data: staff.staffID ?? '-',
                      isEditing: editing,
                      controller: _controllers[12]..text = staff.staffID ?? '-',
                    ),
                  ),
                ],
              ),
              Row(children: [
                Expanded(
                    child: editing
                        ? ListTile(
                            title: TextButton(
                                onPressed: () async {
                                  var data = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          staff.startDate ?? DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime.now());
                                  data != null
                                      ? ref
                                          .watch(startDateProvider.notifier)
                                          .state = data
                                      : null;
                                },
                                child: const Text("Select Start Date")),
                            trailing: Text(DateFormat.yMd().format(
                                ref.watch(startDateProvider) ??
                                    staff.startDate ??
                                    DateTime.now())),
                          )
                        : ListTile(
                            title: const Text("Start Date"),
                            trailing: Text(DateFormat.yMd().format(
                                ref.watch(startDateProvider) ??
                                    staff.startDate ??
                                    DateTime.now())))),
                Expanded(
                    child: editing
                        ? ListTile(
                            title: TextButton(
                                onPressed: () async {
                                  var data = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          staff.endDate ?? DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime.now());
                                  data != null
                                      ? ref
                                          .watch(endDateViewProvider.notifier)
                                          .state = data
                                      : null;
                                },
                                child: const Text("Select End Date")),
                            trailing: Text(DateFormat.yMd().format(
                                ref.watch(endDateViewProvider) ??
                                    staff.endDate ??
                                    DateTime.now())),
                          )
                        : ListTile(
                            title: const Text("End Date"),
                            trailing: Text(DateFormat.yMd().format(
                                ref.watch(endDateViewProvider) ??
                                    staff.endDate ??
                                    DateTime.now())),
                          ))
              ]),
              Row(children: [
                Expanded(
                    child: EditableLabel(
                        label: labels[15],
                        data: ref.watch(nokNameViewProvider(staff)),
                        isEditing: editing,
                        controller: _controllers[15]
                          ..text = staff.nokName ?? "-")),
                Expanded(
                    child: EditableLabel(
                        label: labels[16],
                        data: ref.watch(nokAddressViewProvider(staff)),
                        isEditing: editing,
                        controller: _controllers[16]
                          ..text = staff.nokAddress ?? '-'))
              ]),
              EditableLabel(
                  label: labels[17],
                  data: ref.watch(nokNumberViewProvider(staff)),
                  isEditing: editing,
                  controller: _controllers[17]..text = staff.nokNumber ?? '-'),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Text("${staff.firstname}'s activity"),
                  const Expanded(child: Divider()),
                ],
              ),
              StaffActivity(staffID: staff.staffID!)
            ]),
          ),
        ),
      ),
    );
  }

  String? validator(String? text) {
    if (text == null) {
      return null;
    } else {
      return text.isEmpty ? 'Enter valid input' : null;
    }
  }

  validate() {
    var validated = _key.currentState?.validate();
    if (validated != null && validated) {
      return true;
    }
    return false;
  }
}

final isEditing = StateProvider((ref) => false);
final saveButtonPressed = StateProvider((ref) => false);
