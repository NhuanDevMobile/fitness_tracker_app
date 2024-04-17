import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_food.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_saved_food.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_food.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_food.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/arguments/food_argument.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/saved_food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FoodController extends GetxController {
  final FoodArgument argument = Get.arguments;
  List<FoodModel> foods = [];
  List<UserFoodModel> myFoods = [];
  List<SavedFoodModel> savedFoods = [];
  RxInt currentPage = 0.obs;
  GetuserUseCase getuserUseCase = Get.find();
  int mealId = 0;
  String userId = "";
  @override
  void onInit() async {
    await getuserUseCase.getUser().then((value) {
      userId = value!.uid ?? "";
      getMyFoods(userId: value!.uid ?? "");
      getSavedFoods(userId: value.uid ?? "");
    });
    getFoods();
    super.onInit();
  }

  void getFoods() async {
    final result = await FirestoreFood.getFoods();
    if (result.status == Status.success) {
      foods = result.data!;
      update(["fetchFoods"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  void getMyFoods({required String userId}) async {
    final result = await FirestoreUserFood.getListUserFood(userId);
    if (result.status == Status.success) {
      myFoods = result.data!;
      update(["fetchFoods"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  void getSavedFoods({required String userId}) async {
    final result = await FirestoreSavedFood.getListFoodByUserId(userId);
    if (result.status == Status.success) {
      savedFoods = result.data!;
      update(["fetchFoods"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  void addNewFood(UserFoodModel userFoodModel) {
    myFoods.insert(0, userFoodModel);
    update(["fetchFoods"]);
  }

  void addFoodRelationship(
      {required UserRelationshipFoodModel userRelationFood}) async {
    userRelationFood.mealId = getMealId();
    userRelationFood.createAt =
        DateFormat("yyyy-MM-dd'T'00:00:00").format(argument.dateTime);
    final result = await FirestoreUserRelationshipFood.create(
        userRelationshipFoodModel: userRelationFood, userId: userId);

    if (result.status == Status.success) {
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  String titleAppBar() {
    if (argument.typeDailyMeal == DailyMeals.breakfast) {
      return "breakfast".tr;
    } else if (argument.typeDailyMeal == DailyMeals.lunch) {
      return "lunch".tr;
    } else if (argument.typeDailyMeal == DailyMeals.dinner) {
      return "dinner".tr;
    } else if (argument.typeDailyMeal == DailyMeals.snack) {
      return "snack".tr;
    } else {
      return '';
    }
  }

  int getMealId() {
    if (argument.typeDailyMeal == DailyMeals.breakfast) {
      return 1;
    } else if (argument.typeDailyMeal == DailyMeals.lunch) {
      return 2;
    } else if (argument.typeDailyMeal == DailyMeals.dinner) {
      return 3;
    } else if (argument.typeDailyMeal == DailyMeals.snack) {
      return 4;
    } else {
      return 1;
    }
  }

  onTapDetailFood(FoodModel food) async {
    final callBack = await Get.toNamed(
      Routes.foodDetail,
      arguments: [food, savedFoods],
    );
    if (callBack != null) {
      savedFoods = callBack;
      update(["fetchFoods"]);
    }
  }
}
