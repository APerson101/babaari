import 'package:babaari/dashboard/add_person_view.dart';
import 'package:babaari/dashboard_view.dart';
import 'package:babaari/history_view.dart';
import 'package:babaari/people_view.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  MainView({super.key});
  final _sideMenuController = SideMenuController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: AppBar(), body: const AddPersonView());
    return Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            SideMenu(
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Dashboard',
                  onTap: (page, _) {
                    _sideMenuController.changePage(page);
                    ref.watch(_currentPage.notifier).state = 0;
                  },
                  icon: const Icon(Icons.home),
                  tooltipContent: "Dashboard",
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'People',
                  onTap: (page, _) {
                    _sideMenuController.changePage(page);
                    ref.watch(_currentPage.notifier).state = 1;
                  },
                  icon: const Icon(Icons.people),
                  tooltipContent: "People",
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'History',
                  onTap: (page, _) {
                    _sideMenuController.changePage(page);
                    ref.watch(_currentPage.notifier).state = 2;
                  },
                  icon: const Icon(Icons.history),
                  tooltipContent: "History",
                ),
              ],
              controller: _sideMenuController,
            ),
            const Expanded(child: _GetPage())
          ],
        ));
  }
}

class _GetPage extends ConsumerWidget {
  const _GetPage();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (ref.watch(_currentPage)) {
      case 0:
        return const DashboardView();
      case 1:
        return const PeopleView();
      case 2:
        return const HistoryView();
      default:
        return Container();
    }
  }
}

final _currentPage = StateProvider((ref) => 0);
