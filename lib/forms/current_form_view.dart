import 'package:babaari/dashboard/add_person_view.dart';
import 'package:babaari/forms/add_person_form.dart';
import 'package:babaari/models/adhocstaff.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../helpers/database.dart';
import 'add_hoc_form.dart';

class CurrentFormView extends ConsumerWidget {
  const CurrentFormView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var indexToView = ref.watch(currentViewLocation);
    var form = ref.watch(formToUse);
    var outercontext = context;
    return indexToView != null
        ? Stack(
            children: [
              // Text(),
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                bottom: 50,
                // child: Text("hello"),
                child: AddHocForm(
                    addHocStaff: ref.watch(allForms)[indexToView]
                      ..staffType = form,
                    formMode: form),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          // if can go to previous, go
                          if (indexToView == 0) return;
                          ref.watch(currentViewLocation.notifier).state =
                              indexToView - 1;

                          ref.watch(isExpandedList.notifier).update((state) {
                            state = state.map((e) => false).toList();
                            state[indexToView - 1] = true;
                            state = [...state];
                            return state;
                          });
                        },
                        child: const Text("previous")),
                    TextButton(
                        onPressed: () {
                          debugPrint(
                              'current index: $indexToView, number of people is : ${ref.read(numberOfPeople)}');
                          if (indexToView + 1 == ref.watch(numberOfPeople)) {
                            // save
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Confirm save"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            await Future.delayed(const Duration(
                                                milliseconds: 500));
                                            if (outercontext.mounted) {
                                              await showDialog(
                                                  context: outercontext,
                                                  builder: (context) {
                                                    return const SavingProgressView();
                                                  });
                                            }
                                          },
                                          child: const Text("Proceed")),
                                    ],
                                  );
                                });
                            return;
                          }
                          ref.watch(currentViewLocation.notifier).state =
                              indexToView + 1;
                          ref.watch(isExpandedList.notifier).update((state) {
                            state = state.map((e) => false).toList();
                            state[indexToView + 1] = true;
                            state = [...state];
                            return state;
                          });
                        },
                        child: Text(
                            describeEnum(ref.watch(_nextButton) ?? "ERROR"))),
                  ],
                ),
              )
            ],
          )
        : const Placeholder();
  }
}

final allForms = StateProvider((ref) {
  return List.generate(ref.watch(numberOfPeople), (index) => AddHocStaff());
});

final allDpts = StateProvider(
    (ref) => List.generate(ref.watch(numberOfPeople), (index) => 0));

final formToUse = StateProvider((ref) => AddHocStaffType.corper);

enum FormModes { corpers, siwes }

final _nextButton = StateProvider.autoDispose<_CanMoveToNext?>((ref) {
  int? index = ref.watch(currentViewLocation);
  if (index == null) return null;
  return index + 1 == ref.watch(numberOfPeople)
      ? _CanMoveToNext.save
      : _CanMoveToNext.next;
});

enum _CanMoveToNext { next, save }

class SavingProgressView extends ConsumerWidget {
  const SavingProgressView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: 150,
        height: 150,
        child: ref.watch(saveProvider).when(
            data: (_) {
              return AlertDialog(
                title: const Text("Saved succesfully"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();

                        //clear everything
                        ref.watch(numberOfPeople.notifier).state = 0;
                        ref.watch(currentViewLocation.notifier).state = null;
                      },
                      child: const Text("Continue"))
                ],
              );
            },
            error: (er, st) {
              debugPrint(er.toString());
              return const AlertDialog(
                  title: Center(child: Text("Failed to save")));
            },
            loading: () => const AlertDialog(
                title: Center(child: CircularProgressIndicator.adaptive()))));
  }
}

final saveProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  var forms = ref.read(allForms);
  var db = GetIt.I<DatabaseHelper>();

  await db.saveForms(forms);
});
