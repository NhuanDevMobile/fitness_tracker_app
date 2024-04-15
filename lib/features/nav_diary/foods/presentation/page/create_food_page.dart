import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:flutter/material.dart';

class CreateFoodPage extends StatelessWidget {
  const CreateFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: "add_food",
        centerTitle: true,
      ),
    );
  }
}
