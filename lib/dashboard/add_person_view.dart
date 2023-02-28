import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddPersonView extends HookConsumerWidget {
  AddPersonView({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberToAdd = useTextEditingController();
    final isInputValid = useState(false);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Add new NYSC/SIWES"),
          FlutterToggleTab(
            width: 90,
            borderRadius: 15,
            height: 50,
            selectedIndex: ref.watch(_selectedTab),
            selectedBackgroundColors: const [Colors.blue, Colors.blueAccent],
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
            unSelectedTextStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            icons: const [Icons.person, Icons.people],
            labels: const ['NYSC', 'SIWES'],
            selectedLabelIndex: (index) =>
                ref.watch(_selectedTab.notifier).state = index,
            isScroll: false,
            marginSelected:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          ),
          const Divider(),
          FlutterToggleTab(
            width: 90,
            borderRadius: 15,
            height: 50,
            selectedIndex: ref.watch(_populationTab),
            selectedBackgroundColors: const [Colors.blue, Colors.blueAccent],
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
            unSelectedTextStyle: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            icons: const [
              Icons.person,
              Icons.people,
            ],
            labels: const ['Add Single person', 'Add multiple people'],
            selectedLabelIndex: (index) =>
                ref.watch(_populationTab.notifier).state = index,
            isScroll: false,
            marginSelected:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          ),
          ref.watch(_populationTab) == 1
              ? CupertinoTextFormFieldRow(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (enteredText) {
                    if (enteredText != null) {
                      int? number = int.tryParse(enteredText, radix: 10);
                      if (number != null && number > 0) {
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => isInputValid.value = true);
                        return null;
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => isInputValid.value = false);
                        return 'enter valid number';
                      }
                    }
                    return null;
                  },
                  placeholder: ref.watch(_placeHolder),
                  controller: numberToAdd,
                )
              : Container(),
        ],
      ),
    );
  }
}

final _selectedTab = StateProvider((ref) => 0);
final _placeHolder = StateProvider((ref) {
  return ref.watch(_selectedTab) == 0
      ? 'Enter number of Corpers'
      : "Enter number of SIWES Students";
});
final _populationTab = StateProvider((ref) => 0);
final _validInput = StateProvider((ref) => false);
