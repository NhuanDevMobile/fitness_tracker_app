import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
  RxBool isCollapse = false.obs;
  final formKey = GlobalKey<FormState>();
}
