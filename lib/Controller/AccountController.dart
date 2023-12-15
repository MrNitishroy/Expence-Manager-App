import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/BottomSheetController.dart';
import 'package:expense_manager/Models/AccountModel.dart';
import 'package:expense_manager/Models/DropdownModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:expense_manager/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'IconPickerController.dart';

class AccountCntroller extends GetxController {
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController accountName = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController paymentMode = TextEditingController();
  RxList<AccountModel> accountData = RxList<AccountModel>();
  RxList<DropDownModel> categoryData = RxList<DropDownModel>([
       DropDownModel(
        id: "cat1",
        name: "Food",
        value: "food",
        icon: "Assets/Icons/FoodIcon/food.svg",
      ),
      DropDownModel(
        id: "cat2",
        name: "Shopping",
        value: "shopping",
        icon: "Assets/Icons/FoodIcon/shopping.svg",
      ),
      DropDownModel(
        id: "cat3",
        name: "Travel",
        value: "travel",
        icon: "Assets/Icons/FoodIcon/travel.svg",
      ),
      DropDownModel(
        id: "cat4",
        name: "Bread",
        value: "bread",
        icon: "Assets/Icons/FoodIcon/bread.svg",
      ),
      DropDownModel(
        id: "cat5",
        name: "Chiken",
        value: "chiken",
        icon: "Assets/Icons/FoodIcon/chiken.svg",
      ),
      DropDownModel(
        id: "cat6",
        name: "Rent",
        value: "rent",
        icon: "Assets/Icons/FoodIcon/home.svg",
      ),
      DropDownModel(
        id: "cat7",
        name: "Reacharge",
        value: "reacharge",
        icon: "Assets/Icons/FoodIcon/mobile.svg",
      ),
      DropDownModel(
        id: "cat8",
        name: "Bills",
        value: "bills",
        icon: "Assets/Icons/FoodIcon/other.svg",
      ),
      DropDownModel(
        id: "cat9",
        name: "Others",
        value: "others",
        icon: "Assets/Icons/FoodIcon/other.svg",
      ),
  ]);
  RxList<DropDownModel> paymentModeData = RxList<DropDownModel>();
  Rx<UserModel> currentUserData = Rx<UserModel>(UserModel());
  IconPickerController iconPickerController = Get.put(IconPickerController());
  @override
  void onInit() {
    super.onInit();
    getAccount();
    getCategory();
    getPayementMode();
  }

  bool isPayemntModeGetting = false;
  Future getPayementMode() async {
    if (isPayemntModeGetting) {
      return;
    }
    try {
      isPayemntModeGetting = true;
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
    } finally {
      isPayemntModeGetting = false;
    }
  }

  Future addPaymentMode() async {
    String tempId = Uuid().v1();
    String id = "pay" + tempId;
    var newMode = DropDownModel(
      id: id,
      name: paymentMode.text,
      value: paymentMode.text.toLowerCase(),
      icon: iconPickerController.paymentModeSelectedIconvalue.value,
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .doc(id)
        .set(
          newMode.toJson(),
        );
    successMessage("😍 Payment mode Added");
    paymentMode.clear();
    getPayementMode();
  }

  Future deletePaymentMode(String name) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .doc(name)
        .delete();
    getPayementMode();
    successMessage("🪲 Payment mode Deleted");
  }

  bool isCategoryGetting = false;
  Future getCategory() async {
    if (isCategoryGetting) {
      return;
    }
    try {
      isCategoryGetting = true;
      categoryData.clear();
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("category")
          .get()
          .then((value) {
        for (var e in value.docs) {
          categoryData.add(DropDownModel.fromJson(e.data()));
        }
      });
    } finally {
      isCategoryGetting = false;
    }
  }

  Future addNewCategory() async {
    String tempId = Uuid().v1();
    String id = "cat" + tempId;
    var newCategory = DropDownModel(
      id: id,
      value: category.text.toLowerCase(),
      name: category.text,
      icon: iconPickerController.categorySelectedIconvalue.value,
    );
    if (category.text.isNotEmpty) {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("category")
          .doc(id)
          .set(
            newCategory.toJson(),
          );
      successMessage("😍 Category Added");
      category.clear();
      getCategory();
    } else {
      errorMessage("❌ Please Enter Category Name");
    }
  }

  Future deleteCategory(String name) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("category")
        .doc(name)
        .delete();
    successMessage("🪲 Category Deleted");
  }

  bool isGettingAccount = false;
  Future getAccount() async {
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

  Future addNewAccount(BuildContext context) async {
    String tempId = Uuid().v1();
    String id = "ac" + tempId;
    var newAccount = AccountModel(
      id: id,
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
          .doc(id)
          .set(newAccount.toJson());
      successMessage("🪲 New Account Added");
      accountName.clear();
      getAccount();
    } else {
      errorMessage("❌ Please Enter Account Name");
    }
  }

  Future deleteAccount(String name) async {
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

  Future getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then((value) {
      currentUserData.value = UserModel.fromJson(value.data()!);
    });
  }
}
