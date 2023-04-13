import 'dart:io';

import 'package:babaari/helpers/database.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/printing_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

class PrintView extends ConsumerWidget {
  const PrintView({super.key, this.person});
  final AddHocStaff? person;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return person == null ? _NewPrint() : _ExistingPrint(person: person!);
  }
}

class _NewPrint extends ConsumerWidget {
  _NewPrint();
  final _selectedType = StateProvider((ref) => AddHocStaffType.corper);
  final _corperPrintType = StateProvider((ref) => 'acceptance');
  final statecodeController = TextEditingController();
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  final institutionController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Row(children: [
            RadioMenuButton(
                value: AddHocStaffType.corper,
                groupValue: ref.watch(_selectedType),
                onChanged: (staff) {
                  staff != null
                      ? ref.watch(_selectedType.notifier).state = staff
                      : null;
                },
                child: const Text("Corper")),
            RadioMenuButton(
                value: AddHocStaffType.siwes,
                groupValue: ref.watch(_selectedType),
                onChanged: (siwes) {
                  siwes != null
                      ? ref.watch(_selectedType.notifier).state = siwes
                      : null;
                },
                child: const Text("Siwes"))
          ]),
          Column(
            children: [
              Row(
                children: [
                  RadioMenuButton(
                      value: 'acceptance',
                      groupValue: ref.watch(_corperPrintType),
                      onChanged: (staff) {
                        staff != null
                            ? ref.watch(_corperPrintType.notifier).state =
                                'acceptance'
                            : null;
                      },
                      child: const Text("Acceptance Letter")),
                  RadioMenuButton(
                      value: 'posting',
                      groupValue: ref.watch(_corperPrintType),
                      onChanged: (siwes) {
                        siwes != null
                            ? ref.watch(_corperPrintType.notifier).state = siwes
                            : null;
                      },
                      child: const Text("Department Posting")),
                ],
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                validator: (name) {
                  return name == null
                      ? null
                      : name.isNotEmpty
                          ? null
                          : "Enter valid name";
                },
                decoration: InputDecoration(
                    labelText:
                        ref.watch(_selectedType) == AddHocStaffType.corper
                            ? "Enter corper's name"
                            : 'Enter student name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: statecodeController,
                validator: (name) {
                  return name == null
                      ? null
                      : name.isNotEmpty
                          ? null
                          : "Enter valid ID";
                },
                decoration: InputDecoration(
                    labelText:
                        ref.watch(_selectedType) == AddHocStaffType.corper
                            ? "Enter state code"
                            : "Enter school ID number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: courseController,
                validator: (name) {
                  return name == null
                      ? null
                      : name.isNotEmpty
                          ? null
                          : "Enter valid course";
                },
                decoration: InputDecoration(
                    labelText: "Enter course of study",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: institutionController,
                validator: (name) {
                  return name == null
                      ? null
                      : name.isNotEmpty
                          ? null
                          : "Enter valid institution name";
                },
                decoration: InputDecoration(
                    labelText: "Enter Institution name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var file = await GetIt.I<PrinterDoc>()
                        .generateAcceptanceSIWES(AcceptanceSiwes(
                            name: nameController.text,
                            school: institutionController.text,
                            schoolID: statecodeController.text));
                    final pdf = File(file);

                    await Printing.layoutPdf(
                        onLayout: (_) => pdf.readAsBytes());
                  },
                  child: const Text("PRINT"))
            ],
          )
        ]));
  }
}

class _ExistingPrint extends ConsumerWidget {
  const _ExistingPrint({required this.person});
  final AddHocStaff person;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCorper = person.staffType == AddHocStaffType.corper;
    debugPrint(person.staffType.toString());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Print Letter"),
      ),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Print Acceptance Letter')),
                  isCorper
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text('Print Final Clearance Letter'))
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text("Print SIWES Completion Letter")),
                  isCorper
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text("Print Monthly Clearance"))
                      : const Gap(1)
                ],
              )),
          Positioned(
              right: 0,
              child: Column(
                children: [
                  Text('${person.firstname} ${person.lastname}'),
                  Text('${person.department}: ${person.unit}'),
                  Text(
                      'START DATE: ${DateFormat.yMd().format(person.startDate!)}'),
                  Text(
                      'END DATE:  ${DateFormat.yMd().format(person.endDate!)}'),
                  Text('${person.institutionName} '),
                ],
              )),
        ],
      ),
    );
  }
}

// acceptance
// final clearance
// siwes completion
// department posting
// monthly clearance

enum _PrintOptions {
  acceptance,
  posting,
}
