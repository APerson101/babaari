import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/dashboard_providers.dart';

class WowTester extends ConsumerWidget {
  const WowTester({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            ref.watch(tester).when(
                data: (dr) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("WORKING")));
                },
                error: (er, st) {},
                loading: () {});
          },
          child: const Text("TEST")),
    );
  }
}
