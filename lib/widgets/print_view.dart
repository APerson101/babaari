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
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
  final callUpController = TextEditingController();
  final _selectedGender = StateProvider((ref) => 'M');
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
                  RadioMenuButton(
                      value: 'rejection',
                      groupValue: ref.watch(_corperPrintType),
                      onChanged: (rejection) {
                        rejection != null
                            ? ref.watch(_corperPrintType.notifier).state =
                                rejection
                            : null;
                      },
                      child: const Text("Rejection Letter")),
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
              ref.watch(_selectedType) == AddHocStaffType.corper
                  ? TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: callUpController,
                      validator: (name) {
                        return name == null
                            ? null
                            : name.isNotEmpty
                                ? null
                                : "Enter valid Call of number";
                      },
                      decoration: InputDecoration(
                          labelText: "Enter call of number code",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )
                  : const SizedBox(),
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
              DropdownButtonFormField(
                  value: ref.watch(_selectedGender),
                  items: const [
                    DropdownMenuItem(value: "M", child: Text("Male")),
                    DropdownMenuItem(value: "F", child: Text("Female")),
                  ],
                  onChanged: (selected) => ref
                      .watch(_selectedGender.notifier)
                      .state = selected ?? "M"),
              ElevatedButton(
                  onPressed: () async {
                    String? file;
                    var selected = ref.watch(_corperPrintType);
                    if (selected == 'acceptance' ||
                        selected == 'rejection' &&
                            ref.watch(_selectedType) ==
                                AddHocStaffType.corper) {
                      PdfDocument document = PdfDocument();
                      document.pageSettings.orientation =
                          PdfPageOrientation.portrait;
                      document.pageSettings.margins.all = 30;
                      GetIt.I<PrinterDoc>().generateStatusNysc(
                          document: document,
                          person: AddHocStaff()
                            ..firstname = nameController.text.split(' ')[0]
                            ..lastname = nameController.text.split(' ')[1]
                            ..callUpNumber = callUpController.text
                            ..institutionID = statecodeController.text
                            ..gender = ref.watch(_selectedGender)
                            ..courseOfStudy = courseController.text,
                          type: selected);

                      file = await GetIt.I<PrinterDoc>()
                          .savePdfDocumentAndGetPath(document);
                    }
                    if (file != null) {
                      final docx = File(file);
                      await Printing.layoutPdf(
                          onLayout: (_) => docx.readAsBytes());
                    }
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
              top: 0,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        PdfDocument document = PdfDocument();
                        document.pageSettings.orientation =
                            PdfPageOrientation.portrait;
                        document.pageSettings.margins.all = 30;
                        GetIt.I<PrinterDoc>().generateStatusNysc(
                            person: person,
                            type: 'acceptance',
                            document: document);
                        var file = await GetIt.I<PrinterDoc>()
                            .savePdfDocumentAndGetPath(document);
                        final docx = File(file);
                        await Printing.layoutPdf(
                            onLayout: (_) => docx.readAsBytes());
                      },
                      child: const Text('Acceptance\nLetter')),
                  ElevatedButton(
                      onPressed: () async {
                        PdfDocument document = PdfDocument();
                        document.pageSettings.orientation =
                            PdfPageOrientation.portrait;
                        document.pageSettings.margins.all = 30;
                        GetIt.I<PrinterDoc>().generateStatusNysc(
                            person: person,
                            type: 'rejection',
                            document: document);
                        var file = await GetIt.I<PrinterDoc>()
                            .savePdfDocumentAndGetPath(document);
                        final docx = File(file);
                        await Printing.layoutPdf(
                            onLayout: (_) => docx.readAsBytes());
                      },
                      child: const Text('Rejection\nLetter')),
                  isCorper
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text('Final Clearance Letter'))
                      : ElevatedButton(
                          onPressed: () {},
                          child: const Text("SIWES Completion Letter")),
                  isCorper
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text("Monthly Clearance"))
                      : const Gap(1)
                ],
              )),
          Positioned(
              right: 0,
              left: 0,
              top: 50,
              height: MediaQuery.of(context).size.height * .7,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: ListTile(
                            title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${person.firstname} ${person.lastname}'),
                    ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${person.department}: ${person.unit}'),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        subtitle: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Start Date"),
                          ),
                        ),
                        title: Text(DateFormat.yMd().format(person.startDate!)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        subtitle: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("End Date"),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(DateFormat.yMd().format(person.endDate!)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          subtitle: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Institution"),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${person.institutionName}'),
                          )),
                    ),
                  ),
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
