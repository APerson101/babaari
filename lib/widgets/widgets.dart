import 'package:babaari/helpers/database.dart';
import 'package:babaari/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../models/department.dart';

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
        return DropdownButton<String>(
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
        return DropdownButton(
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
      return Row(
        children: [
          Text('$label: '),
          Text(data ?? ""),
        ],
      );
    }
  }
}

final userDepartment = StateProvider.autoDispose((ref) => '');
final userUnit = StateProvider.autoDispose((ref) => "");
