import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/adhocstaff.dart';
import 'current_form_view.dart';

class AddHocForm extends ConsumerWidget {
  AddHocForm({super.key, required this.addHocStaff, required this.formMode});
  final AddHocStaff addHocStaff;
  final FormModes formMode;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController tagNameController = TextEditingController();
  final TextEditingController anotherTagNameController =
      TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    firstNameController.text = addHocStaff.firstname ?? '';
    lastNameController.text = addHocStaff.lastname ?? '';
    addressNameController.text = addHocStaff.houseAddress ?? '';
    tagNameController.text = addHocStaff.accountName ?? '';
    anotherTagNameController.text = addHocStaff.bankName ?? '';

    return Form(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormFieldModel(
                onChanged: (name) => addHocStaff.firstname = name,
                controller: firstNameController,
                hintText: 'Enter first name',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormFieldModel(
                onChanged: (name) => addHocStaff.lastname = name,
                controller: lastNameController,
                hintText: 'Enter last name',
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormFieldModel(
              onChanged: (address) => addHocStaff.houseAddress = address,
              controller: addressNameController,
              hintText: 'Enter address',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormFieldModel(
              onChanged: (tag) => addHocStaff.accountName = tag,
              controller: tagNameController,
              hintText: 'Enter tag name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormFieldModel(
              onChanged: (tagger) => addHocStaff.bankName = tagger,
              controller: anotherTagNameController,
              hintText: 'Enter another tag name',
            ),
          ),
        ],
      ),
    ));
  }
}

class FormFieldModel extends ConsumerWidget {
  const FormFieldModel(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onChanged});
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
