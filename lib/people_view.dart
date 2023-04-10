import 'package:babaari/models/adhocstaff.dart';
import 'package:babaari/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'helpers/database.dart';

class PeopleView extends ConsumerWidget {
  const PeopleView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var creator = ref.watch(createPeople);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Corpers and Interns"),
        actions: const [SearchBarWidget()],
      ),
      body: creator.when(data: (_) {
        // show table of everyone
        return const Center(
          child: Text("search for anything"),
        );
      }, error: (Object error, StackTrace stackTrace) {
        return const Center(child: Text("ERROR"));
      }, loading: () {
        return const CircularProgressIndicator.adaptive();
      }),
    );
  }
}

final createPeople = FutureProvider((ref) async {
  return;
  var isar = GetIt.I<DatabaseHelper>();

  await isar.saveStaff(List.generate(
      30,
      (index) => AddHocStaff()
        ..accountName = 'Account Name'
        ..accountNumber = '0123849688'
        ..bankName = 'GTBank'
        ..courseOfStudy = 'Computer Science'
        ..department = 'ITIS'
        ..unit = 'Software'
        ..endDate = DateTime.now()
        ..startDate = DateTime.now()
        ..firstname = 'Abdulhadi'
        ..lastname = 'Hashim'
        ..houseAddress = 'Wuse, Abuja'
        ..phoneNumber = '08159730537'
        ..institutionName = 'Afe Babalola University'
        ..institutionID = 'FC/21C/10200'
        ..nokAddress = 'Amina close'
        ..staffType = AddHocStaffType.corper
        ..nokName = 'Sister'
        ..nokNumber = '09124630793'
        ..staffID = '${index + 1}'
        ..registeredDate = DateTime.now()));
});
