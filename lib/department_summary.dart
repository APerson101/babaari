import 'package:babaari/dashboard/dashboard_providers.dart';
import 'package:babaari/helpers/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/adhocstaff.dart';
import 'models/department.dart';

class DepartmentSummary extends ConsumerWidget {
  DepartmentSummary({super.key});
  final Map<String, int> corpersList = {};
  final Map<String, int> siwesList = {};
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDpts = ref.watch(allDepartments);

    return ref.watch(allAdhocStaff).when(
          data: (data) {
            sortedList(data);
            return allDpts.when(
                error: (Object error, StackTrace stackTrace) =>
                    const Center(child: Text("Error loading")),
                loading: () => const CircularProgressIndicator.adaptive(),
                data: (List<Department> departments) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...departments.map((department) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: DecoratedBox(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.indigo.shade300),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.people),
                                    )),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                tileColor: Colors.indigo.shade400,
                                title: Text(department.name ?? '-'),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(children: [
                                    Expanded(
                                        child: Row(children: [
                                      const CircleAvatar(
                                        radius: 5,
                                        backgroundColor: Colors.green,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                            "Corpers: ${corpersList[department.name]}"),
                                      )
                                    ])),
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.blue,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                              "SIWES: ${siwesList[department.name]}"),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(),
                                    )
                                  ]),
                                ),
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          error: (er, st) => const Text("ERROR"),
          loading: () => const CircularProgressIndicator.adaptive(),
        );
  }

  sortedList(List<AddHocStaff>? allStaff) {
    if (allStaff == null) return;
    for (var person in allStaff) {
      if (person.staffType == AddHocStaffType.corper) {
        corpersList[person.department!] =
            corpersList[person.department!] != null
                ? corpersList[person.department!]! + 1
                : 1;
      } else {
        siwesList[person.department!] = siwesList[person.department!] != null
            ? siwesList[person.department!]! + 1
            : 1;
      }
    }
  }
}
