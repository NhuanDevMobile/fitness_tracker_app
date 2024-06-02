import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/search_activity_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/item_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchActivityPage extends GetView<SearchActivityController> {
  const SearchActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'search_activity',
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearch(),
          Obx(() {
            return controller.isFilter.value
                ? _buildListSearchFilter()
                : _buildListSearch();
          }),
        ],
      ),
    );
  }

  _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFieldWidget(
        hintText: "search_activity".tr,
        borderRadius: 20.0,
        backgroundColor: AppColors.white,
        prefixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        controller: controller.searchActivity,
        onChanged: (value) {
          controller.onTypingFinished();
        },
      ),
    );
  }

  _buildListSearch() {
    return GetBuilder<SearchActivityController>(
      id: "searchActivity",
      builder: (logic) {
        return Expanded(
          child: controller.listActivity.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: controller.listActivity.length,
                  itemBuilder: (context, index) {
                    return ItemActivity(
                      activityModel: controller.listActivity[index],
                    );
                  },
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  _buildListSearchFilter() {
    return GetBuilder<SearchActivityController>(
      id: "searchActivity",
      builder: (logic) {
        return Expanded(
          child: controller.listFilterActivity.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: controller.listFilterActivity.length,
                  itemBuilder: (context, index) {
                    return ItemActivity(
                      activityModel: controller.listFilterActivity[index],
                    );
                  },
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
