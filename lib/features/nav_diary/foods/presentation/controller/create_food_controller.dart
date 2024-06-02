import 'dart:io';

import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firebase_storage/firebase_storage.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_food.dart';
import 'package:fitness_tracker_app/core/ui/dialogs/dialogs.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateFoodController extends GetxController {
  TextEditingController nameFood = TextEditingController();
  TextEditingController qtyFood = TextEditingController();
  TextEditingController unitFood = TextEditingController();
  TextEditingController caloFood = TextEditingController();
  TextEditingController proteinFood = TextEditingController();
  TextEditingController carbFood = TextEditingController();
  TextEditingController fatFood = TextEditingController();
  TextEditingController cholesterolFood = TextEditingController();
  TextEditingController calciumFood = TextEditingController();
  TextEditingController sodiumFood = TextEditingController();
  GetuserUseCase getuserUseCase = Get.find();
  final ImagePicker picker = ImagePicker();
  UserModel? user;
  RxBool isCollapse = false.obs;
  final formKey = GlobalKey<FormState>();
  RxString imageFoodPath = "".obs;
  RxBool isLoading = false.obs;
  File? imageFood;
  @override
  void onInit() async {
    user = await getuserUseCase.getUser();
  }

  void uploadImageFood() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      XFile? xImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 1024.0,
        maxWidth: 1024.0,
      );
      if (xImage == null) {
        return;
      } else {
        imageFood = File(xImage!.path);
        update(['uploadFile']);
        // if (user != null) {
        //   final result = await FirebaseStorageData.uploadImage(
        //       imageFile: fileImage,
        //       userId: user!.uid ?? "",
        //       collection: "user_foods");
        //   if (result.status == Status.success) {
        //     imageFoodPath.value = result.data ?? "";
        //   } else {}
        // }
      }
    } else if (status.isDenied) {
      await openAppSettings();
    } else {
      await openAppSettings();
    }
  }

  void createFood() async {
    if (isLoading.value) {
      return;
    }

    dynamic data = {
      "userId": user!.uid,
      "foodName": nameFood.text,
      "servingQty": int.parse(qtyFood.text),
      "servingUnit": unitFood.text,
      "nfCalories": double.parse(caloFood.text),
    };
    if (proteinFood.text.isNotEmpty) {
      data['nfProtein'] = double.parse(proteinFood.text);
    }
    if (carbFood.text.isNotEmpty) {
      data['nfTotalCarbohydrate'] = double.parse(carbFood.text);
    }
    if (fatFood.text.isNotEmpty) {
      data['nfTotalFat'] = double.parse(fatFood.text);
    }
    if (cholesterolFood.text.isNotEmpty) {
      data['nfCholesterol'] = double.parse(cholesterolFood.text);
    }
    if (sodiumFood.text.isNotEmpty) {
      data['nfSodium'] = double.parse(sodiumFood.text);
    }
    if (calciumFood.text.isNotEmpty) {
      data['nfCanxi'] = double.parse(calciumFood.text);
    }
    isLoading.value = true;
    if (user != null && imageFood != null) {
      final result = await FirebaseStorageData.uploadImage(
          imageFile: imageFood!,
          userId: user!.uid ?? "",
          collection: "user_foods");
      if (result.status == Status.success) {
        data['photoUrl'] = result.data ?? "";
      } else {
        SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
      }
    }
    final result = await FirestoreUserFood.create(
        food: UserFoodModel.fromJson(data), userId: user!.uid ?? "");
    isLoading.value = false;
    if (result.status == Status.success) {
      UserFoodModel userFoodModel = result.data!;
      if (Get.isRegistered<FoodController>()) {
        FoodController foodController = Get.find();
        foodController.addNewFood(userFoodModel);
      }
      Get.back();
      DialogsUtils.showAlertDialog(
          title: "Create food",
          message: "Add food success",
          typeDialog: TypeDialog.success);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }
}
