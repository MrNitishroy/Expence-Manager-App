import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class IconPickerController extends GetxController {
  List iconsPath = [
    "Assets/Icons/FoodIcon/apple.svg",
    "Assets/Icons/FoodIcon/bread.svg",
    "Assets/Icons/FoodIcon/chiken.svg",
    "Assets/Icons/FoodIcon/food.svg",
    "Assets/Icons/FoodIcon/food1.svg",
    "Assets/Icons/FoodIcon/home.svg",
    "Assets/Icons/FoodIcon/house.svg",
    "Assets/Icons/FoodIcon/milk.svg",
    "Assets/Icons/FoodIcon/mobile.svg",
    "Assets/Icons/FoodIcon/other.svg",
    "Assets/Icons/FoodIcon/shopping.svg",
    "Assets/Icons/FoodIcon/tamato.svg",
    "Assets/Icons/FoodIcon/travel.svg",
    "Assets/Icons/PyementMode/bank.svg",
    "Assets/Icons/PyementMode/cash.svg",
    "Assets/Icons/back.svg",
    "Assets/Icons/bank.svg",
    "Assets/Icons/calender.svg",
    "Assets/Icons/clock.svg",
    "Assets/Icons/donw.svg",
    "Assets/Icons/email.svg",
    "Assets/Icons/expense.svg",
    "Assets/Icons/google.svg",
    "Assets/Icons/income.svg",
    "Assets/Icons/lock.svg",
    "Assets/Icons/logo.svg",
    "Assets/Icons/password.svg",
    "Assets/Icons/rupee.svg",
  ];
  RxString accountSelectedIconvalue = "Assets/Icons/bank.svg".obs;
  RxString categorySelectedIconvalue = "Assets/Icons/FoodIcon/other.svg".obs;
  RxString paymentModeSelectedIconvalue = "Assets/Icons/PyementMode/cash.svg".obs;
  
  void accountIconSelector(BuildContext context) async {
    await Get.defaultDialog(
      title: "Select Icon",
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        padding: EdgeInsets.all(10),
        width: Get.width,
        height: 250,
        child: GridView.count(
          crossAxisCount: 6,
          crossAxisSpacing: 15,
          
          mainAxisSpacing: 15,
          children: iconsPath
              .map(
                (e) => InkWell(
                    onTap: () {
                      accountSelectedIconvalue.value = e;
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      e,
                    )),
              )
              .toList(),
        ),
      ),
    );
  }
  void categoryIconSelector(BuildContext context) async {
    await Get.defaultDialog(
      title: "Select Icon",
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        padding: EdgeInsets.all(10),
        width: Get.width,
        height: 250,
        child: GridView.count(
          crossAxisCount: 6,
          crossAxisSpacing: 15,
          
          mainAxisSpacing: 15,
          children: iconsPath
              .map(
                (e) => InkWell(
                    onTap: () {
                      categorySelectedIconvalue.value = e;
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      e,
                    )),
              )
              .toList(),
        ),
      ),
    );
  }
  void paymentModeIconSelector(BuildContext context) async {
    await Get.defaultDialog(
      title: "Select Icon",
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        padding: EdgeInsets.all(10),
        width: Get.width,
        height: 250,
        child: GridView.count(
          crossAxisCount: 6,
          crossAxisSpacing: 15,
          
          mainAxisSpacing: 15,
          children: iconsPath
              .map(
                (e) => InkWell(
                    onTap: () {
                      paymentModeSelectedIconvalue.value = e;
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      e,
                    )),
              )
              .toList(),
        ),
      ),
    );
  }
}
