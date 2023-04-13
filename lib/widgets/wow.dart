import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WowTester extends ConsumerWidget {
  const WowTester({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(onPressed: () {}, child: const Text("TEST")),
    );
  }
}
