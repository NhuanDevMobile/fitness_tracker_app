import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/item_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchActivityPage extends StatelessWidget {
  const SearchActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'search_activity',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearch(),
            _buildListSearch(),
          ],
        ),
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
      ),
    );
  }

  _buildListSearch() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const ItemActivity();
      },
    );
  }
}
