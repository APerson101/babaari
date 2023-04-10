import 'package:babaari/helpers/database.dart';
import 'package:babaari/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

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

final _isTyping = StateProvider((ref) => false);

class EditableLabel extends ConsumerWidget {
  EditableLabel(
      {super.key,
      required this.isEditing,
      required this.controller,
      required this.data,
      required this.label});
  bool isEditing;
  String data;
  String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isEditing) {
      return TextFormField(
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
    } else {
      return Row(
        children: [
          Text('$label: '),
          Text(data),
        ],
      );
    }
  }
}
