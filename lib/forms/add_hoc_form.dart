import 'package:babaari/dashboard/add_person_view.dart';
import 'package:babaari/helpers/database.dart';
import 'package:babaari/widgets/view_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/dashboard_providers.dart';
import '../models/adhocstaff.dart';
import '../widgets/widgets.dart';

class AddHocForm extends ConsumerWidget {
  AddHocForm({super.key, required this.addHocStaff, required this.formMode});
  final AddHocStaff addHocStaff;
  final AddHocStaffType formMode;
  final callUpController = TextEditingController();

  final List<TextEditingController> controllers =
      List.generate(18, (index) => TextEditingController());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    addHocStaff.gender = addHocStaff.gender ?? "M";
    final dpts = ref.watch(allDepartments);
    return dpts.maybeWhen(data: (data) {
      final selectedDpt = StateProvider((ref) {
        var d = data
            .indexWhere((element) => element.name == addHocStaff.department);
        d == -1 ? addHocStaff.department = data[0].name : null;
        return d == -1 ? 0 : d;
      });
      final selectedUnit = StateProvider((ref) {
        var dpt = ref.watch(selectedDpt);
        var u = data[dpt].units?.indexOf(addHocStaff.unit ?? "null");
        u == -1 ? addHocStaff.unit = data[0].units![0] : null;
        return u == -1 ? 0 : u;
      });
      final selectedGender = StateProvider((ref) => addHocStaff.gender ?? "M");

      return SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: EditableLabel(
                  onChanged: (text) {
                    addHocStaff.firstname = text;
                  },
                  controller: controllers[0]
                    ..text = addHocStaff.firstname ?? "",
                  label: labels[0],
                  isEditing: true,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: EditableLabel(
                  onChanged: (text) {
                    addHocStaff.lastname = text;
                  },
                  controller: controllers[1]..text = addHocStaff.lastname ?? "",
                  label: labels[1],
                  isEditing: true,
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditableLabel(
                  onChanged: (callUp) {
                    addHocStaff.callUpNumber = callUp;
                  },
                  isEditing: true,
                  controller: callUpController
                    ..text = addHocStaff.callUpNumber ?? "",
                  label: 'Call up Number'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  value: ref.watch(selectedGender),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  items: const [
                    DropdownMenuItem(value: "M", child: Text("Male")),
                    DropdownMenuItem(value: "F", child: Text("Female")),
                  ],
                  onChanged: (selected) {
                    ref.watch(selectedGender.notifier).state = selected ?? "M";
                    addHocStaff.gender = selected ?? "M";
                  }),
            ),
            ...List.generate(controllers.length - 2, (index) {
              var num = index + 2;
              var label = index == 4
                  ? ref.watch(selectedTab) == 0
                      ? "State Code"
                      : "School ID"
                  : labels[num];
              Function(String) changed = (txt) {};
              switch (index) {
                case 0:
                  changed = (text) {
                    addHocStaff.phoneNumber = text;
                  };
                  controllers[index + 2].text = addHocStaff.phoneNumber ?? "";
                  break;

                case 1:
                  changed = (text) {
                    addHocStaff.houseAddress = text;
                  };
                  controllers[index + 2].text = addHocStaff.houseAddress ?? "";
                  break;
                case 2:
                  changed = (txt) {
                    addHocStaff.institutionName = txt;
                  };
                  controllers[index + 2].text =
                      addHocStaff.institutionName ?? "";
                  break;
                case 3:
                  changed = (txt) {
                    addHocStaff.courseOfStudy = txt;
                  };
                  controllers[index + 2].text = addHocStaff.courseOfStudy ?? "";
                  break;
                case 4:
                  changed = (txt) {
                    addHocStaff.institutionID = txt;
                  };
                  controllers[index + 2].text = addHocStaff.institutionID ?? "";
                  break;
                case 5:
                  changed = (txt) {
                    addHocStaff.bankName = txt;
                  };
                  controllers[index + 2].text = addHocStaff.bankName ?? "";
                  break;
                case 6:
                  changed = (txt) {
                    addHocStaff.accountName = txt;
                  };
                  controllers[index + 2].text = addHocStaff.accountName ?? "";
                  break;
                case 7:
                  changed = (txt) {
                    addHocStaff.accountNumber = txt;
                  };
                  controllers[index + 2].text = addHocStaff.accountNumber ?? "";
                  break;
                case 10:
                  changed = (txt) {
                    addHocStaff.staffID = txt;
                  };
                  controllers[index + 2].text = addHocStaff.staffID ?? "";
                  break;
                case 13:
                  changed = (txt) {
                    addHocStaff.nokName = txt;
                  };
                  controllers[index + 2].text = addHocStaff.nokName ?? "";
                  break;
                case 14:
                  changed = (txt) {
                    addHocStaff.nokAddress = txt;
                  };
                  controllers[index + 2].text = addHocStaff.nokAddress ?? "";
                  break;
                case 15:
                  changed = (txt) {
                    addHocStaff.nokNumber = txt;
                  };
                  controllers[index + 2].text = addHocStaff.nokNumber ?? "";
                  break;
              }
              if (index == 8) {
                return DropdownButton(
                    value: ref.watch(selectedDpt),
                    items: data
                        .map((e) => DropdownMenuItem(
                            value: data.indexOf(e), child: Text(e.name ?? "")))
                        .toList(),
                    onChanged: (selected) {
                      if (selected != null) {
                        controllers[10].text = data[selected].name!;
                        addHocStaff.department = data[selected].name!;
                        ref.watch(selectedDpt.notifier).state = selected;
                      }
                    });
              }
              if (index == 9) {
                var department = data[ref.watch(selectedDpt)];
                return DropdownButton(
                    value: ref.watch(selectedUnit),
                    items: department.units!
                        .map((e) => DropdownMenuItem(
                            value: department.units?.indexOf(e),
                            child: Text(e)))
                        .toList(),
                    onChanged: (selected) {
                      if (selected != null) {
                        controllers[11].text = department.units![selected];
                        addHocStaff.unit = department.units![selected];

                        ref.watch(selectedUnit.notifier).state = selected;
                      }
                    });
              }

              if (index == 11) {
                return ElevatedButton(
                    onPressed: () async {
                      var selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2023),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2023));
                      if (selectedDate != null) {
                        controllers[13].text = selectedDate.toString();
                        addHocStaff.startDate = selectedDate;
                      }
                    },
                    child: const Text("Start Date"));
              }

              if (index == 12) {
                return ElevatedButton(
                    onPressed: () async {
                      var selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.tryParse(
                                  addHocStaff.endDate.toString()) ??
                              DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(DateTime.now().year + 3));
                      if (selectedDate != null) {
                        controllers[14].text = selectedDate.toString();
                        addHocStaff.endDate = selectedDate;
                      }
                    },
                    child: const Text("End Date"));
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
                      onChanged: changed,
                      controller: controllers[num],
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
