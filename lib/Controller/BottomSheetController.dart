import 'package:expense_manager/Models/DropdownModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  RxBool isFocus = false.obs;
  FocusNode focusNode = FocusNode();
  RxBool isIncome = false.obs;
  RxString amountValue = "".obs;
  RxString paymentModeValue = "cash".obs;
  RxString paymentResionValue = "food".obs;
  TextEditingController comment = TextEditingController();
  List paymentModeData = [
    DropDownModel(
      name: "Cash",
      value: "cash",
      icon: "Assets/Icons/PyementMode/cash.svg",
    ),
    DropDownModel(
      name: "Bank",
      value: "bank",
      icon: "Assets/Icons/PyementMode/bank.svg",
    ),
  ];

  List payemntResoneData = [
    DropDownModel(
      name: "Food",
      value: "food",
      icon: "Assets/Icons/FoodIcon/food.svg",
    ),
    DropDownModel(
      name: "Shopping",
      value: "shopping",
      icon: "Assets/Icons/FoodIcon/shopping.svg",
    ),
    DropDownModel(
      name: "Travel",
      value: "travel",
      icon: "Assets/Icons/FoodIcon/travel.svg",
    ),
    DropDownModel(
      name: "Bread",
      value: "bread",
      icon: "Assets/Icons/FoodIcon/bread.svg",
    ),
    DropDownModel(
      name: "Chiken",
      value: "chiken",
      icon: "Assets/Icons/FoodIcon/chiken.svg",
    ),
    DropDownModel(
      name: "Rent",
      value: "rent",
      icon: "Assets/Icons/FoodIcon/home.svg",
    ),
    DropDownModel(
      name: "Reacharge",
      value: "reacharge",
      icon: "Assets/Icons/FoodIcon/mobile.svg",
    ),
    DropDownModel(
      name: "Bills",
      value: "bills",
      icon: "Assets/Icons/FoodIcon/other.svg",
    ),
    DropDownModel(
      name: "Others",
      value: "others",
      icon: "Assets/Icons/FoodIcon/other.svg",
    ),
  ];
}
