import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepartmentSummary extends ConsumerWidget {
  const DepartmentSummary({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              12,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: DecoratedBox(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo.shade300),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.people),
                          )),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: Colors.indigo.shade400,
                      title: const Text("Deparment Name"),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(children: [
                          Expanded(
                              child: Row(children: const [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text("Corpers: 40"),
                            )
                          ])),
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.blue,
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("SIWES: 40"),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          )
                        ]),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }
}
