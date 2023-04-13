import 'package:babaari/forms/current_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../forms/add_person_form.dart';

class AddPersonView extends HookConsumerWidget {
  const AddPersonView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ref.watch(numberOfPeople.notifier).state = 0;
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              left: 10,
              top: 10,
              bottom: 10,
              width: MediaQuery.of(context).size.width * 0.3,
              child: const FormControllerView()),
          Positioned(
              right: 10,
              top: 10,
              bottom: 10,
              width: MediaQuery.of(context).size.width * 0.65,
              child: const CurrentFormView()),
        ],
      ),
    );
  }
}

class FormControllerView extends HookConsumerWidget {
  const FormControllerView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberToAdd = useTextEditingController();
    final isInputValid = useState(false);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("Add new NYSC/SIWES"),
          SizedBox(
            width: MediaQuery.of(context).size.width * .2,
            // height: 150,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: FlutterToggleTab(
                borderRadius: 15,
                height: 200,
                selectedIndex: ref.watch(selectedTab),
                selectedBackgroundColors: const [
                  Colors.blue,
                  Colors.blueAccent
                ],
                selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.w700),
                unSelectedTextStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 46,
                    fontWeight: FontWeight.w500),
                icons: const [Icons.person, Icons.people],
                labels: const ['NYSC', 'SIWES'],
                selectedLabelIndex: (index) {
                  // check if null
                  var tab = ref.watch(selectedTab);
                  var status = true;
                  bool switchToSiwes =
                      (ref.watch(formToUse) == FormModes.corpers && tab == 0);
                  bool switchToNYSC =
                      (ref.watch(formToUse) == FormModes.siwes && tab == 1);
                  if (switchToSiwes || switchToNYSC) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("clear all progress?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    status = false;
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    if (switchToSiwes) {
                                      ref.watch(corpersList.notifier).state =
                                          null;
                                      ref.watch(formToUse.notifier).state =
                                          FormModes.siwes;
                                    } else {
                                      ref.watch(siwesList.notifier).state =
                                          null;
                                      ref.watch(formToUse.notifier).state =
                                          FormModes.corpers;
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Proceed")),
                            ],
                          );
                        });
                  }
                  if (!status) return;
                  ref.watch(selectedTab.notifier).state = index;
                },
                isScroll: false,
                marginSelected:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              ),
            ),
          ),
          TextFormField(
            onChanged: (txt) {
              if (int.tryParse(txt) != null) {
                //its an integer
                if (int.tryParse(txt)! < 50) {
                  ref.watch(numberOfPeople.notifier).state = int.tryParse(txt)!;
                }
              } else {
                ref.watch(numberOfPeople.notifier).state = 0;
                ref.watch(currentViewLocation.notifier).state = null;
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            validator: (enteredText) {
              if (enteredText != null) {
                int? number = int.tryParse(enteredText);
                if (number != null && number > 0) {
                  if (number >= 50) {
                    WidgetsBinding.instance.addPostFrameCallback(
                        (_) => isInputValid.value = false);
                    return 'number too high!, Please reduce';
                  }
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => isInputValid.value = true);
                  return null;
                } else {
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => isInputValid.value = false);
                  return 'enter valid number';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: ref.watch(_placeHolder),
            ),
            controller: numberToAdd,
          ),
          ref.watch(numberOfPeople) > 1
              ? ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {
                          ref.watch(isExpandedList.notifier).update((state) {
                            state =
                                List.generate(state.length, (index) => false);
                            state = [...state];
                            return state;
                          });
                        },
                        child: const Text("Collapse all")),
                    TextButton(
                        onPressed: () {
                          ref.watch(isExpandedList.notifier).update((state) {
                            state =
                                List.generate(state.length, (index) => true);
                            state = [...state];
                            return state;
                          });
                        },
                        child: const Text("Expand all")),
                  ],
                )
              : Container(),
          AddPersonsForm()
        ],
      ),
    );
  }
}

final selectedTab = StateProvider.autoDispose((ref) => 0);
final numberOfPeople = StateProvider((ref) => 0);
final _placeHolder = StateProvider.autoDispose((ref) {
  return ref.watch(selectedTab) == 0
      ? 'Enter number of Corpers'
      : "Enter number of SIWES Students";
});
