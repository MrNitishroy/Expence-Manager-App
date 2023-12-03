import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController{
  RxBool isFocus = false.obs;
  FocusNode focusNode = FocusNode();

  RxString amountValue = "".obs;

}