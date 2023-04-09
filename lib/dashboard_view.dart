import 'package:babaari/template_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard/add_person_view.dart';
import 'dashboard/dashboard_providers.dart';
import 'department_summary.dart';
import 'recent_actions.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AddPersonView();
    return Stack(
      children: [
        Positioned(
            top: 30,
            height: MediaQuery.of(context).size.height * .25,
            left: 20,
            right: MediaQuery.of(context).size.width * .35,
            child: const _ButtonsView()),
        Positioned(
            left: 20,
            bottom: MediaQuery.of(context).size.height * .6,
            right: MediaQuery.of(context).size.width * .35,
            child: Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Department Summary"),
                ),
                Expanded(child: Divider())
              ],
            )),
        Positioned(
            bottom: 20,
            left: 20,
            right: MediaQuery.of(context).size.width * .35,
            height: MediaQuery.of(context).size.height * .55,
            child: const _StatisticsView()),
        Positioned(
            right: 30,
            top: 30,
            width: MediaQuery.of(context).size.width * .3,
            child: Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text("Today's Activity"),
                ),
                Expanded(child: Divider())
              ],
            )),
        Positioned(
            bottom: 20,
            top: 70,
            right: 30,
            width: MediaQuery.of(context).size.width * 0.3,
            child: const _DailyActivityView())
      ],
    );
  }
}

class _StatisticsView extends ConsumerWidget {
  const _StatisticsView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: DepartmentSummary());
  }
}

class _ButtonsView extends ConsumerWidget {
  const _ButtonsView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String numberofCorpers = ref.watch(numberOfCorpers).when(
        data: (data) => data != null ? data.toString() : 'none',
        error: (er, st) => 'ERROR',
        loading: () => '....');
    String numberofsiwes = ref.watch(numberOfSiwes).when(
        data: (data) => data != null ? data.toString() : 'none',
        error: (er, st) => 'ERROR',
        loading: () => '...');
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTemplate(
                      icon: const Icon(
                        Icons.add,
                        size: 36,
                      ),
                      backgroundcolor: Colors.purple.shade200,
                      iconcolor: Colors.purple.shade300,
                      line1: 'Add',
                      line2: 'New Person',
                      onTap: () {}))),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTemplate(
                backgroundcolor: Colors.red.shade200,
                iconcolor: Colors.red.shade300,
                icon: const Icon(
                  Icons.remove,
                  size: 36,
                ),
                line1: 'Remove',
                line2: 'Existing',
                onTap: () {}),
          )),
          const VerticalDivider(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTemplate(
              bgcolor: Colors.green.shade200,
              line1: 'Number of',
              line2: 'NYSC',
              txt: numberofCorpers,
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTemplate(
              bgcolor: Colors.blue.shade200,
              line1: 'Number of',
              line2: 'SIWES',
              txt: numberofsiwes,
            ),
          ))
        ]));
  }
}

class _DailyActivityView extends ConsumerWidget {
  const _DailyActivityView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: RecentActionsView());
  }
}
