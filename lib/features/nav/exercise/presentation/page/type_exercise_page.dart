import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/features/nav/exercise/data/type_exercise_data.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/widgets/item_type_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class TypeExercisePage extends StatelessWidget {
  const TypeExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: AppColors.primary,
        leading: SizedBox.shrink(),
        title: "exercise",
        centerTitle: true,
        titleColor: AppColors.white,
      ),
      body: GridView.custom(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              6 / 8,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return ItemTypeExercise(
              item: TypeExerciseData.typeExercise[index],
              index: index,
              onTap: () {
                Get.toNamed(
                  Routes.exercise,
                  arguments: TypeExerciseData.typeExercise[index],
                );
              },
            );
          },
          childCount: TypeExerciseData.typeExercise.length,
        ),
      ),
    );
  }
}
