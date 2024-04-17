import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/progress_bar.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_provider_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/custom_textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/create_food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateFoodPage extends GetView<CreateFoodController> {
  const CreateFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(
        title: "add_food",
        centerTitle: true,
      ),
      body: bodyContent(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Obx(() {
          return !controller.isLoading.value
              ? ButtonWidget(
                  text: "Lưu",
                  ontap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.createFood();
                    }
                  },
                  height: 35.0,
                  backgroundColor: AppColors.primary,
                )
              : ButtonWidget(
                  text: "",
                  ontap: () {},
                  height: 35.0,
                  backgroundColor: AppColors.primary,
                  child: const Center(
                    child: ProgressBar(),
                  ),
                );
        }),
      ),
    );
  }

  Widget bodyContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            imageFood(),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    height: 60.0,
                    hintText: "Tên thực phẩm",
                    controller: controller.nameFood,
                    onChanged: (value) {},
                    obscureText: false,
                    isShowBorder: true,
                    focusedColor: AppColors.black.withOpacity(0.8),
                    focusedWidth: 1.0,
                    enableColor: AppColors.black.withOpacity(0.8),
                    enableWidth: 1.0,
                    borderRadius: 5.0,
                  ),
                  const SizedBox(height: 15.0),
                  CustomTextFieldWidget(
                    height: 60.0,
                    hintText: "Số lượng, gram",
                    controller: controller.qtyFood,
                    onChanged: (value) {},
                    obscureText: false,
                    isShowBorder: true,
                    focusedColor: AppColors.black.withOpacity(0.8),
                    focusedWidth: 1.0,
                    enableColor: AppColors.black.withOpacity(0.8),
                    enableWidth: 1.0,
                    borderRadius: 5.0,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 15.0),
                  CustomTextFieldWidget(
                    height: 60.0,
                    hintText: "Đơn vị",
                    controller: controller.unitFood,
                    onChanged: (value) {},
                    obscureText: false,
                    isShowBorder: true,
                    focusedColor: AppColors.black.withOpacity(0.8),
                    focusedWidth: 1.0,
                    enableColor: AppColors.black.withOpacity(0.8),
                    enableWidth: 1.0,
                    borderRadius: 5.0,
                  ),
                  const SizedBox(height: 15.0),
                  CustomTextFieldWidget(
                    height: 60.0,
                    hintText: "Năng lượng, Calo",
                    controller: controller.caloFood,
                    onChanged: (value) {},
                    obscureText: false,
                    isShowBorder: true,
                    focusedColor: AppColors.black.withOpacity(0.8),
                    focusedWidth: 1.0,
                    enableColor: AppColors.black.withOpacity(0.8),
                    enableWidth: 1.0,
                    borderRadius: 5.0,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Obx(() {
              return ExpansionPanelList(
                elevation: 0,
                expansionCallback: (panelIndex, expanded) {
                  controller.isCollapse.value = !controller.isCollapse.value;
                },
                children: [
                  ExpansionPanel(
                      backgroundColor: AppColors.transparent,
                      headerBuilder: (context, isExpanded) {
                        return const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: "Thông tin dinh dưỡng",
                              size: AppDimens.textSize16,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              text: "Tùy chọn",
                              size: AppDimens.textSize16,
                            ),
                          ],
                        );
                      },
                      body: buildOptionForm(),
                      isExpanded: controller.isCollapse.value,
                      canTapOnHeader: true),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Widget buildOptionForm() {
    return Column(
      children: [
        CustomTextFieldWidget(
          height: 60.0,
          hintText: "Protein/Chất đạm, gram",
          controller: controller.proteinFood,
          onChanged: (value) {},
          obscureText: false,
          isShowBorder: true,
          focusedColor: AppColors.black.withOpacity(0.8),
          focusedWidth: 1.0,
          enableColor: AppColors.black.withOpacity(0.8),
          enableWidth: 1.0,
          borderRadius: 5.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15.0),
        CustomTextFieldWidget(
          height: 60.0,
          hintText: "Carbs/Chất bột đường, gram",
          controller: controller.carbFood,
          onChanged: (value) {},
          obscureText: false,
          isShowBorder: true,
          focusedColor: AppColors.black.withOpacity(0.8),
          focusedWidth: 1.0,
          enableColor: AppColors.black.withOpacity(0.8),
          enableWidth: 1.0,
          borderRadius: 5.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15.0),
        CustomTextFieldWidget(
          height: 60.0,
          hintText: "Fat/Chất béo, gram",
          controller: controller.fatFood,
          onChanged: (value) {},
          obscureText: false,
          isShowBorder: true,
          focusedColor: AppColors.black.withOpacity(0.8),
          focusedWidth: 1.0,
          enableColor: AppColors.black.withOpacity(0.8),
          enableWidth: 1.0,
          borderRadius: 5.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15.0),
        CustomTextFieldWidget(
          height: 60.0,
          hintText: "Cholesterol, mg",
          controller: controller.cholesterolFood,
          onChanged: (value) {},
          obscureText: false,
          isShowBorder: true,
          focusedColor: AppColors.black.withOpacity(0.8),
          focusedWidth: 1.0,
          enableColor: AppColors.black.withOpacity(0.8),
          enableWidth: 1.0,
          borderRadius: 5.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15.0),
        CustomTextFieldWidget(
          height: 60.0,
          hintText: "Calcium/Canxi, mg",
          controller: controller.calciumFood,
          onChanged: (value) {},
          obscureText: false,
          isShowBorder: true,
          focusedColor: AppColors.black.withOpacity(0.8),
          focusedWidth: 1.0,
          enableColor: AppColors.black.withOpacity(0.8),
          enableWidth: 1.0,
          borderRadius: 5.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15.0),
        CustomTextFieldWidget(
          height: 60.0,
          hintText: "Sodium/Na-tri, mg",
          controller: controller.sodiumFood,
          onChanged: (value) {},
          obscureText: false,
          isShowBorder: true,
          focusedColor: AppColors.black.withOpacity(0.8),
          focusedWidth: 1.0,
          enableColor: AppColors.black.withOpacity(0.8),
          enableWidth: 1.0,
          borderRadius: 5.0,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Widget imageFood() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, top: 15.0),
      child: Row(
        children: [
          GetBuilder<CreateFoodController>(
            id: "uploadFile",
            builder: (logic) {
              return GestureDetector(
                onTap: () {
                  controller.uploadImageFood();
                },
                child: controller.imageFood != null
                    ? ImageProviderSquareWidget(
                        height: 60.0,
                        imageUrl: controller.imageFood!,
                        width: 60.0,
                        borderRadius: 8.0,
                      )
                    : Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColors.gray2),
                        child: const Center(
                          child: Icon(Icons.image_outlined),
                        ),
                      ),
              );
            },
          ),
          const SizedBox(width: 15.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Thêm ảnh", size: AppDimens.textSize13),
              TextWidget(
                  text: "Thêm ảnh thực phẩm", size: AppDimens.textSize16),
            ],
          )
        ],
      ),
    );
  }
}
