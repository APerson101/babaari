import 'package:babaari/activity/activity_providers.dart';
import 'package:babaari/dashboard/dashboard_providers.dart';
import 'package:babaari/models/activity.dart';
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
                    ? {
                        ref.watch(saveButtonPressed.notifier).state = false,
                        ref.watch(userDepartment.notifier).state =
                            staff.department!,
                        ref.watch(userUnit.notifier).state = staff.unit!,
                      }
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
      List.generate(19, (index) => TextEditingController());
  final _key = GlobalKey<FormState>();
  final db = GetIt.I<DatabaseHelper>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allDepartments).when(data: (departments) {
      var editing = ref.watch(isEditing);
      var startDate = ref.watch(startDateProvider);
      startDate ??= staff.startDate;
      startDate ??= DateTime.now();
      var endDate = ref.watch(endDateViewProvider);
      endDate ??= staff.endDate;
      endDate ??= DateTime.now();
      var gender = StateProvider((ref) => staff.gender);

      ref.listen(saveButtonPressed, (pr, nx) async {
        if (pr != nx && nx) {
          if (!validate()) {
            return;
          }
          var sDate = ref.watch(startDateProvider);
          sDate ??= startDate;
          var eDate = ref.watch(startDateProvider);
          eDate ??= endDate;
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
          staff.startDate = sDate;
          staff.endDate = eDate;
          staff.nokName = _controllers[15].text;
          staff.nokAddress = _controllers[16].text;
          staff.nokNumber = _controllers[17].text;
          staff.gender = ref.read(gender);
          await db.updateStaff(staff);

          //invalidate suggestions
          ref.invalidate(loadNames);
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green, content: Text("SUCCESS!")));
          }
          ref.watch(addActivity(Activity()
            ..created = DateTime.now()
            ..type = ActivityType.update
            ..staffID = staff.staffID
            ..message =
                'Successfully updated ${staff.firstname} ${staff.lastname}'));
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      editing
                          ? Expanded(
                              child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              value: ref.watch(gender),
                              onChanged: (selected) {
                                if (selected != null) {
                                  ref.watch(gender.notifier).state = selected;
                                }
                              },
                              items: const [
                                DropdownMenuItem(
                                    value: "M", child: Text("Male")),
                                DropdownMenuItem(
                                    value: 'F', child: Text("Female")),
                              ],
                            ))
                          : Expanded(
                              child: Card(
                                  child: ListTile(
                                      subtitle: const Text("Gender"),
                                      title:
                                          Text(staff.gender ?? "No gender"))),
                            ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: EditableLabel(
                          label: labels[2],
                          data: staff.phoneNumber!,
                          isEditing: editing,
                          controller: _controllers[2]
                            ..text = staff.phoneNumber!,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                EditableLabel(
                  label: labels[3],
                  data: staff.houseAddress!,
                  isEditing: editing,
                  controller: _controllers[3]..text = staff.houseAddress!,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
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
                        controller: _controllers[5]
                          ..text = staff.courseOfStudy!,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      staff.staffType == AddHocStaffType.corper
                          ? Expanded(
                              child: EditableLabel(
                                label: 'Call Up Number',
                                data: staff.callUpNumber!,
                                isEditing: editing,
                                controller: _controllers[18]
                                  ..text = staff.callUpNumber!,
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                          width: staff.staffType == AddHocStaffType.corper
                              ? 10
                              : 0),
                      Expanded(
                        child: EditableLabel(
                          label: staff.staffType == AddHocStaffType.corper
                              ? 'State Code'
                              : "School ID",
                          data: staff.institutionID!,
                          isEditing: editing,
                          controller: _controllers[6]
                            ..text = staff.institutionID!,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                EditableLabel(
                  label: labels[7],
                  data: staff.bankName ?? '-',
                  isEditing: editing,
                  controller: _controllers[7]..text = staff.bankName ?? '-',
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: EditableLabel(
                        label: labels[10],
                        departments: departments,
                        data: staff.department ?? '-',
                        isEditing: editing,
                        controller: _controllers[10]
                          ..text = staff.department ?? '-',
                      ),
                    ),
                    Expanded(
                      child: EditableLabel(
                        label: labels[11],
                        departments: departments,
                        dpt: staff.department,
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
                        controller: _controllers[12]
                          ..text = staff.staffID ?? '-',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                              trailing:
                                  Text(DateFormat.yMd().format(startDate)),
                            )
                          : Card(
                              child: ListTile(
                                  subtitle: const Text("Start Date"),
                                  title:
                                      Text(DateFormat.yMd().format(startDate))),
                            )),
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
                              trailing: Text(DateFormat.yMd().format(endDate)),
                            )
                          : Card(
                              child: ListTile(
                                subtitle: const Text("End Date"),
                                title: Text(DateFormat.yMd().format(endDate)),
                              ),
                            ))
                ]),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                EditableLabel(
                    label: labels[17],
                    data: ref.watch(nokNumberViewProvider(staff)),
                    isEditing: editing,
                    controller: _controllers[17]
                      ..text = staff.nokNumber ?? '-'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text("${staff.firstname}'s activity"),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 10),
                StaffActivity(staffID: staff.staffID!)
              ]),
            ),
          ),
        ),
      );
    }, error: (Object error, StackTrace stackTrace) {
      return const Center(child: Text("ERROR"));
    }, loading: () {
      return const Center(child: CircularProgressIndicator.adaptive());
    });
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

final isEditing = StateProvider.autoDispose((ref) => false);
final saveButtonPressed = StateProvider.autoDispose((ref) => false);
