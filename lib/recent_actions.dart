import 'package:babaari/activity/activity_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'models/activity.dart';

class RecentActionsView extends ConsumerWidget {
  RecentActionsView({super.key});

  final scroll = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(todayActivities);
    final allActivity = ref.watch(todayActivities);

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFDB84B1),
              Color(0xFF3A3E88),
            ],
          ),
        ),
        child: allActivity.when(
            data: (activities) {
              if (activities.isEmpty) {
                return const Center(
                  child: Text("No activities today yet"),
                );
              }
              scroll.hasClients
                  ? scroll.animateTo(scroll.position.maxScrollExtent,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn)
                  : null;
              return ListView.builder(
                  controller: scroll,
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    activities = activities.reversed.toList();
                    return _buildTimelineTile(
                        indicator: const _IconIndicator(
                            iconData: Icons.sunny, size: 20),
                        model: activities[index],
                        isLast: activities[index] == activities.last);
                  });
            },
            error: (er, st) => const Center(child: Text("Failed to load")),
            loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                )));
  }

  TimelineTile _buildTimelineTile({
    required _IconIndicator indicator,
    required Activity model,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.3,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: indicator,
      ),
      isLast: isLast,
      startChild: Center(
        child: Container(
          alignment: const Alignment(0.0, -0.50),
          child: Text(
            '${model.created!.hour.toString()} : ${model.created!.minute}',
            style: GoogleFonts.lato(
              fontSize: 18,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      endChild: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              describeEnum(model.type),
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              model.message!,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({Key? key, required this.iconData, required this.size})
      : super(key: key);

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: size,
                color: const Color(0xFF9E3773).withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
