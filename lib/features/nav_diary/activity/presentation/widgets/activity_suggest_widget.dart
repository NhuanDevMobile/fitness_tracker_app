import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/item_activity.dart';
import 'package:flutter/material.dart';

class ActivitySuggestWidget extends StatelessWidget {
  const ActivitySuggestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const ItemActivity();
        });
  }
}
