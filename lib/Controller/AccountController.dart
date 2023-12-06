import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/BottomSheetController.dart';
import 'package:expense_manager/Models/AccountModel.dart';
import 'package:expense_manager/Models/DropdownModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountCntroller extends GetxController {
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController accountName = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController paymentMode = TextEditingController();
  RxList<AccountModel> accountData = RxList<AccountModel>();
  RxList<DropDownModel> categoryData = RxList<DropDownModel>();
  RxList<DropDownModel> paymentModeData = RxList<DropDownModel>();

  @override
  void onInit() {
    super.onInit();
    getAccount();
    getCategory();
    getPayementMode();
  }

  void getPayementMode() async {
    paymentModeData.clear();
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .get()
        .then((value) {
      for (var element in value.docs) {
        paymentModeData.add(DropDownModel.fromJson(element.data()));
      }
    });
  }

  void addPaymentMode() async {
    var newMode = DropDownModel();
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .add(
          newMode.toJson(),
        );
    successMessage("😍 Payment mode Added");
  }

  void deletePaymentMode(String name) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .doc(name)
        .delete();
    successMessage("🪲 Payment mode Deleted");
  }

  void getCategory() async {
    paymentModeData.clear();
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("category")
        .get()
        .then((value) {
      for (var element in value.docs) {
        categoryData.add(DropDownModel.fromJson(element.data()));
      }
    });
  }

  void addNewCategory() async {
    var newCategory = DropDownModel(
      value: category.text.toLowerCase(),
      name: category.text,
      icon: "Assets/Icons/FoodIcon/food1.svg",
    );
    if (category.text.isNotEmpty) {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("category")
          .add(
            newCategory.toJson(),
          );
      successMessage("😍 Category Added");
      category.clear();
    } else {
      errorMessage("❌ Please Enter Category Name");
    }
  }

  void deleteCategory(String name) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("category")
        .doc(name)
        .delete();
    successMessage("🪲 Category Deleted");
  }

  bool isGettingAccount = false;
  void getAccount() async {
    if (isGettingAccount) {
      return;
    }
    try {
      isGettingAccount = true;
      var querySnapshot = await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accounts")
          .get();
      accountData.clear(); // Clear before populating to avoid duplicates
      for (var element in querySnapshot.docs) {
        accountData.add(AccountModel.fromJson(element.data()));
        print(element.data());
      }
    } finally {
      isGettingAccount = false;
    }
  }

  void addNewAccount(BuildContext context) async {
    var newAccount = AccountModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: accountName.text,
      expense: 0,
      income: 0,
      total: 0,
      time: TimeOfDay.now().format(context),
      date: DateFormat("dd MMM yyyy").format(
        DateTime.now(),
      ),
    );
    if (accountName.text.isNotEmpty) {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accounts")
          .doc(accountName.text)
          .set(newAccount.toJson());
      successMessage("🪲 New Account Added");
      accountName.clear();
      getAccount();
    } else {
      errorMessage("❌ Please Enter Account Name");
    }
  }

  void deleteAccount(String name) async {
    print(name);
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(name)
        .delete();
    successMessage("🪲 Account Deleted");
    getAccount();
  }
}
