import 'dart:io';

import 'package:babaari/helpers/database.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/printing_types.dart';
import 'package:babaari/widgets/search_result.dart';
import 'package:babaari/widgets/view_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:printing/printing.dart';

import '../models/department.dart';

//**
//Let K be a field ataached across
//various things that can not be defined */
class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadNames).when(
        data: (suggestions) {
          return Autocomplete<String>(
            optionsBuilder: (texteditingvalue) {
              if (texteditingvalue.text.isEmpty) {
                return const Iterable.empty();
              }
              return suggestions.where((element) => element.contains(
                  texteditingvalue.text.toLowerCase().trim().toString()));
            },
            onSelected: (selected) {
              //show results with this name
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchResult(name: selected)));
            },
            fieldViewBuilder: (context, controller, node, fieldSubmitted) {
              return SizedBox(
                width: 300,
                child: TextFormField(
                  controller: controller,
                  focusNode: node,
                  onChanged: (val) => ref.watch(_isTyping.notifier).state =
                      val.isNotEmpty ? true : false,
                  onFieldSubmitted: (value) {
                    // fieldSubmitted();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SearchResult(name: value)),
                    );
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    suffixIcon: !ref.watch(_isTyping)
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              controller.text = '';
                              ref.watch(_isTyping.notifier).state = false;
                            },
                          ),
                    hintText: 'search for names',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (er, st) => const Text("ERROR"),
        loading: () => const CircularProgressIndicator.adaptive());
  }
}

final loadNames = FutureProvider<List<String>>((ref) async {
  var db = GetIt.I<DatabaseHelper>();
  return db.loadCSVNames();
});
final loadSchools = FutureProvider<List<String>>((ref) async {
  var db = GetIt.I<DatabaseHelper>();
  return db.loadCSVSchool();
});

final _isTyping = StateProvider((ref) => false);
final _isTypingSchool = StateProvider((ref) => false);

class EditableLabel extends ConsumerWidget {
  EditableLabel(
      {super.key,
      this.data,
      required this.isEditing,
      required this.controller,
      this.onChanged,
      this.dpt,
      this.departments,
      required this.label});
  bool isEditing;
  String? data;
  String? dpt;
  List<Department>? departments;
  String label;
  Function(String)? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isEditing) {
      if (label == 'Department') {
        return DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
            value: ref.watch(userDepartment),
            items: departments!.map((e) {
              return DropdownMenuItem(
                value: e.name,
                child: Text(e.name ?? "-"),
              );
            }).toList(),
            onChanged: (selected) {
              selected != null
                  ? {
                      controller.text = selected,
                      ref.watch(userDepartment.notifier).state = selected,
                      ref.watch(userUnit.notifier).state = departments![
                              departments!.indexWhere(
                                  (element) => element.name == selected)]
                          .units![0]
                    }
                  : null;
            });
      }

      if (label == 'unit') {
        var units = departments!
            .firstWhere((el) => el.name == ref.watch(userDepartment))
            .units;
        return DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
            value: ref.watch(userUnit),
            items: units!.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (selected) {
              selected != null
                  ? {
                      controller.text = selected,
                      ref.watch(userUnit.notifier).state = selected
                    }
                  : null;
            });
      }
      if (label == 'Institution') {
        return ref.watch(loadSchools).when(
            data: (suggestions) {
              return Autocomplete<String>(
                optionsBuilder: (texteditingvalue) {
                  if (texteditingvalue.text.isEmpty) {
                    return const Iterable.empty();
                  }
                  var potential = suggestions.where((element) => element
                      .trim()
                      .contains(texteditingvalue.text
                          .toLowerCase()
                          .trim()
                          .toString()));
                  return potential;
                },
                onSelected: (selected) {
                  controller.text = selected;
                },
                fieldViewBuilder: (context, ctrl, node, fieldSubmitted) {
                  return TextFormField(
                    focusNode: node,
                    onChanged: (val) {
                      onChanged!(val);
                      ref.watch(_isTypingSchool.notifier).state =
                          val.isNotEmpty ? true : false;
                    },
                    controller: ctrl..text = controller.text,
                    decoration: InputDecoration(
                        constraints: BoxConstraints.loose(
                            Size(MediaQuery.of(context).size.width, 100)),
                        labelText: label,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  );
                },
              );
            },
            error: (er, st) => const Text("ERROR"),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()));
      } else {
        return TextFormField(
          onChanged: onChanged,
          controller: controller,
          validator: (text) {
            if (text == null) {
              return null;
            } else {
              return text.isEmpty ? 'Enter valid input' : null;
            }
          },
          decoration: InputDecoration(
              constraints: BoxConstraints.loose(
                  Size(MediaQuery.of(context).size.width, 100)),
              labelText: label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        );
      }
    } else {
      return Card(
        child: ListTile(
          subtitle: Text(label),
          title: Text(data ?? ""),
        ),
      );
    }
  }
}

final userDepartment = StateProvider.autoDispose((ref) => '');
final userUnit = StateProvider.autoDispose((ref) => "");

class MultiPrintDailogWidget extends ConsumerWidget {
  const MultiPrintDailogWidget({super.key, required this.staff});
  final List<AddHocStaff> staff;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var corpers =
        staff.where((d) => d.staffType == AddHocStaffType.corper).toList();
    var intern =
        staff.where((d) => d.staffType == AddHocStaffType.siwes).toList();
    var corperWatch = ref.watch(multiPrintProvider);
    var siwesWatch = ref.watch(multiPrintSiwesProvider);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("print Details"),
          actions: [
            TextButton(
                onPressed: () async {
                  var pth = await GetIt.I<PrinterDoc>().generateMutliPrint(
                      corpers: corpers,
                      options: ref.read(multiPrintProvider),
                      intern: intern,
                      internOptions: ref.read(multiPrintSiwesProvider));
                  final pdf = File(pth);
                  await Printing.layoutPdf(onLayout: (_) => pdf.readAsBytes());
                },
                child:
                    const Text("print", style: TextStyle(color: Colors.white)))
          ]),
      body: Center(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Divider()),
                Text("Corpers"),
                Expanded(child: Divider()),
              ],
            ),
          ),
          ...corpers.map((cor) {
            var corperDets = corperWatch[corpers.indexOf(cor)];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${cor.firstname!} ${cor.lastname!}'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ...PrintOptionsCorper.values.map((e) {
                    return Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: corperDets.contains(e)
                                    ? Colors.green
                                    : Colors.black,
                                width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          title: Text(describeEnum(e)),
                          trailing: corperDets.contains(e)
                              ? const Icon(Icons.remove)
                              : const Icon(Icons.check),
                          onTap: () {
                            corperDets.contains(e)
                                ? ref
                                    .watch(multiPrintProvider.notifier)
                                    .removeItem(e, corpers.indexOf(cor))
                                : ref
                                    .watch(multiPrintProvider.notifier)
                                    .addItem(e, corpers.indexOf(cor));
                          },
                        ),
                      ),
                    );
                  }).toList()
                ],
              )),
            );
          }).toList(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Divider()),
                Text("Siwes"),
                Expanded(child: Divider()),
              ],
            ),
          ),
          ...intern.map((intr) {
            var intDets = siwesWatch[intern.indexOf(intr)];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${intr.firstname!} ${intr.lastname!}'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ...PrintOptonsSiwes.values.map((e) {
                    return Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: intDets.contains(e)
                                    ? Colors.green
                                    : Colors.black,
                                width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          title: Text(describeEnum(e)),
                          trailing: intDets.contains(e)
                              ? const Icon(Icons.remove)
                              : const Icon(Icons.check),
                          onTap: () {
                            intDets.contains(e)
                                ? ref
                                    .watch(multiPrintSiwesProvider.notifier)
                                    .removeItem(e, intern.indexOf(intr))
                                : ref
                                    .watch(multiPrintSiwesProvider.notifier)
                                    .addItem(e, intern.indexOf(intr));
                          },
                        ),
                      ),
                    );
                  }).toList()
                ],
              )),
            );
          }).toList(),
        ]),
      ),
    );
  }
}

enum PrintOptionsCorper {
  acceptance,
  rejection,
  monthlyclearance,
  finalclearance,
  departmentPosting
}

enum PrintOptonsSiwes {
  acceptance,
  rejection,
  finalClearance,
  departmentPosting
}
