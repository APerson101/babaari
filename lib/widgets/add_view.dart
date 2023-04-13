import 'package:babaari/activity/activity_providers.dart';
import 'package:babaari/models/activity.dart';
import 'package:babaari/models/department.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/dashboard_providers.dart';

class AddView extends ConsumerWidget {
  const AddView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            leading: ref.watch(_isEditing)
                ? BackButton(
                    onPressed: () {
                      ref.watch(_isEditing.notifier).state = false;
                    },
                  )
                : null),
        body: ref.watch(_isEditing) ? _EditView() : const _InfoView());
  }
}

class _InfoView extends ConsumerWidget {
  const _InfoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allDepartments).when(
        data: (departments) {
          if (departments.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No Departments Added Yet"),
                  const SizedBox(
                    height: 75,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.watch(_dpt.notifier).state = null;
                        ref.watch(_isEditing.notifier).state = true;
                      },
                      child: const Text("Add Department"))
                ],
              ),
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        var dpt = departments[ref.watch(_selectedDpt)];
                        debugPrint('about to edit ${dpt.toString()}');
                        ref.watch(_dpt.notifier).state = dpt;
                        ref.watch(_isEditing.notifier).state = true;
                      },
                      child: const Text("Edit\nDepartment")),
                  ElevatedButton(
                      onPressed: () {
                        ref.watch(_dpt.notifier).state = null;
                        ref.watch(_isEditing.notifier).state = true;
                      },
                      child: const Text("Add\nDepartment")),
                  ElevatedButton(
                      onPressed: () async {
                        var dpt = departments[ref.watch(_selectedDpt)];

                        await showDialog(
                            context: context,
                            builder: (context1) {
                              return AlertDialog(
                                content: Text(
                                    "Are you sure you want to delete: ${dpt.name}"),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.of(context1).pop();
                                        ref.watch(idToDelete.notifier).state =
                                            dpt.id;
                                        ScaffoldMessenger.of(context1)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text("DELETING")));
                                        await ref.watch(deleteDpt);
                                        if (context.mounted) {
                                          ref.watch(addActivity(Activity()
                                            ..created = DateTime.now()
                                            ..message =
                                                'Deleted ${dpt.name} department'
                                            ..type = ActivityType.delete
                                            ..staffID = 'admin'));
                                          ScaffoldMessenger.of(context1)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text("SUCCESS")));
                                        }
                                      },
                                      child: const Text("Continue")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel")),
                                ],
                              );
                            });
                      },
                      child: const Text("Delete\nDepartment"))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: DropdownButton<int>(
                          value: ref.watch(_selectedDpt),
                          hint: const Text("Select Department"),
                          items: departments
                              .map((e) => DropdownMenuItem(
                                    value: departments.indexOf(e),
                                    child: Text(e.name ?? ""),
                                  ))
                              .toList(),
                          onChanged: (newSelected) {
                            newSelected != null
                                ? ref.watch(_selectedDpt.notifier).state =
                                    newSelected
                                : null;
                          })),
                  Expanded(
                      child:
                          Text(departments[ref.watch(_selectedDpt)].name ?? ""))
                ],
              ),
              ...List.generate(
                  departments[ref.watch(_selectedDpt)].units?.length ?? 0,
                  (index) => Text(
                      departments[ref.watch(_selectedDpt)].units?[index] ?? ""))
            ],
          );
        },
        error: ((error, stackTrace) =>
            const Center(child: Text("Failed to load departments"))),
        loading: () {
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }
}

class _EditView extends ConsumerWidget {
  _EditView();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Editing department ${ref.watch(_dpt).toString()}');
    var selectedDpt = ref.watch(_dpt);
    selectedDpt ??= Department()..units = [];
    List<TextEditingController> allUnitsControllers = [];
    return AbsorbPointer(
      absorbing: ref.watch(_isSaving),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState?.validate() == true) {
                      ref.watch(_isSaving.notifier).state = true;
                      List<String> formatted = [];
                      for (var un in allUnitsControllers) {
                        if (un.text.isNotEmpty) {
                          formatted.add(un.text);
                        }
                      }
                      selectedDpt?.units = formatted;
                      await ref.watch(updateDpt(selectedDpt!));
                      ref.invalidate(_newUnits);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("SUCCESS")));
                      ref.watch(_isSaving.notifier).state = false;

                      ref.watch(_isEditing.notifier).state = true;

                      ref.watch(addActivity(Activity()
                        ..created = DateTime.now()
                        ..message = 'Updated ${selectedDpt.name} department'
                        ..type = ActivityType.update
                        ..staffID = 'admin'));
                    }
                  },
                  child: const Text("Save Changes")),
              TextFormField(
                validator: (text) {
                  if (text == null) {
                    return 'Department must Not be empty';
                  } else if (text.isEmpty) {
                    return 'Department must Not be empty';
                  }
                  return null;
                },
                onChanged: (text) {
                  if (text.isNotEmpty) selectedDpt!.name = text;
                },
                controller: TextEditingController(text: selectedDpt.name),
                decoration: InputDecoration(
                    labelText: 'Department',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              ...List.generate(selectedDpt.units?.length ?? 0, (index) {
                var controller =
                    TextEditingController(text: selectedDpt!.units?[index]);
                allUnitsControllers.add(controller);
                return TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Unit ${index + 1}',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    controller: controller);
              }),
              ...List.generate(ref.watch(_newUnits), (index) {
                var controller = TextEditingController();
                allUnitsControllers.add(controller);
                return TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      labelText:
                          'Unit ${(selectedDpt?.units?.length ?? 0) + index + 1}',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                );
              }),
              ElevatedButton(
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          var controller = TextEditingController();
                          return AlertDialog(
                            title: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                  hintText: 'Enter number of units',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40))),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    ref.watch(_newUnits.notifier).state =
                                        int.tryParse(controller.text) ?? 0;
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Continue")),
                            ],
                          );
                        });
                  },
                  child: const Text('Add unit'))
            ],
          ),
        ),
      ),
    );
  }
}
//*
// ADD DEPARTMENTS AND UNITS: DONE
// ADD PRINT: SOMEWHAT ALMOST THERE: DONE
// simulate printing and new form : DONE
// TEST DASHBOARD: DONE
// Proper filtering with bank stuff
// *//

final _isEditing = StateProvider.autoDispose((ref) => false);
final _selectedDpt = StateProvider.autoDispose((ref) => 0);
final _isSaving = StateProvider.autoDispose((ref) => false);
final _newUnits = StateProvider.autoDispose((ref) => 0);
final idToDelete = StateProvider((ref) => 0);
final _dpt = StateProvider<Department?>((ref) => null);
