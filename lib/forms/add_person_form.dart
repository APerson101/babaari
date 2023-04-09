import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/add_person_view.dart';

class AddPersonsForm extends ConsumerWidget {
  AddPersonsForm({super.key});
  final panelKey = GlobalKey();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var number = ref.watch(numberOfPeople);
    return ExpansionPanelList(
      key: panelKey,
      expansionCallback: (location, isopen) {
        ref.watch(isExpandedList.notifier).update((state) {
          state = state.map((e) => false).toList();
          state[location] = !isopen;
          var liveView = ref.watch(currentViewLocation);
          if (state[location] == true) {
            ref.watch(currentViewLocation.notifier).state = location;
          } else if (state[location] == false && liveView == location) {
            ref.watch(currentViewLocation.notifier).state = null;
          }
          state = [...state];
          return state;
        });
      },
      children: List.generate(number, (index) {
        return ExpansionPanel(
          backgroundColor: ref.watch(currentViewLocation) == index
              ? Colors.blueAccent.shade200
              : null,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Text(index.toString());
          },
          body: Text(index.toString()),
          isExpanded: ref.watch(isExpandedList)[index],
        );
      }),
    );
  }
}

final isExpandedList = StateProvider.autoDispose(
    (ref) => List.generate(ref.watch(numberOfPeople), (index) => false));
final currentViewLocation = StateProvider.autoDispose<int?>((ref) => null);
final corpersList = StateProvider<List?>((ref) => null);
final siwesList = StateProvider<List?>((ref) => null);
