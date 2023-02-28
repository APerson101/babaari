import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonTemplate extends ConsumerWidget {
  const ButtonTemplate(
      {super.key,
      required this.icon,
      required this.line1,
      required this.backgroundcolor,
      required this.iconcolor,
      required this.line2,
      required this.onTap});
  final Widget icon;
  final Color iconcolor;
  final Color backgroundcolor;
  final String line1;
  final String line2;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: backgroundcolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(line1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Text(line2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              DecoratedBox(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: iconcolor),
                child: Padding(padding: const EdgeInsets.all(4.0), child: icon),
              )
            ],
          ),
        ));
  }
}

class DataTemplate extends ConsumerWidget {
  const DataTemplate(
      {super.key,
      required this.line1,
      required this.line2,
      required this.bgcolor,
      required this.txt});
  final String line1;
  final String line2;
  final Color bgcolor;
  final String txt;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: bgcolor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(line1,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Text(line2,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                txt,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
