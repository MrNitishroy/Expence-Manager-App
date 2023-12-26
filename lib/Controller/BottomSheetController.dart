import 'package:expense_manager/Models/DropdownModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  RxBool isFocus = false.obs;
  FocusNode focusNode = FocusNode();
  RxBool isIncome = false.obs;
  RxString amountValue = "".obs;
  RxString paymentModeValue = "cash".obs;
  RxString paymentResionValue = "others".obs;
  RxString paymentResionIconValue = "Assets/Icons/FoodIcon/other.svg".obs;
  TextEditingController comment = TextEditingController();
 
}
