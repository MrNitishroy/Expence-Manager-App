import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Models/AccountModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:expense_manager/Models/TransactionModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'BottomSheetController.dart';

class DbController extends GetxController {
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxString accountSelected = "personal".obs;
  RxBool isLoading = true.obs;
  RxList<TransactionModel> transactionList = RxList<TransactionModel>();
  Rx<AccountModel> selectedAccountDetails = Rx<AccountModel>(AccountModel());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    getTransactionList();

    accountCntroller.getAccount();
    Future.delayed(Duration(seconds: 3), () {
      accountCntroller.getAccount();
      setAccountDetails();
      accountCntroller.getCategory();
      accountCntroller.getPayementMode();
      accountCntroller.getUserDetails();
      successMessage("🤑 Account Updated");
      isLoading.value = false;
    });
  }

  void onAccountSelected() {
    getTransactionList();
    setAccountDetails();
  }

  void onPageRefresh() async {
    isLoading.value = true;
    await accountCntroller.getAccount();
    await setAccountDetails();
    await accountCntroller.getCategory();
    await accountCntroller.getPayementMode();
    await accountCntroller.getUserDetails();
    await getTransactionList();
    print("refress");
    successMessage("❤️ Refresh");
    isLoading.value = false;
  }

  Future getTransactionList() async {
    transactionList.clear();
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .get()
        .then((value) {
      for (var element in value.docs) {
        transactionList.add(TransactionModel.fromJson(element.data()));
      }
    });
  }

  Future addTransaction(BuildContext context) async {
    String tempId = Uuid().v1();
    String id = "tran" + tempId;
    if (bottomSheetController.amountValue.value == "") {
      errorMessage("Please Enter Amount");
      return;
    } else {
      int amount = int.parse(bottomSheetController.amountValue.value);
      String time = TimeOfDay.now().format(context);
      String date = DateFormat("dd MMM yyyy").format(
        DateTime.now(),
      );
      var transactionModel = TransactionModel(
        id: id,
        amount: amount,
        paymentType: bottomSheetController.paymentModeValue.value,
        category: bottomSheetController.paymentResionValue.value,
        comment: bottomSheetController.comment.text,
        date: date,
        iconPath: bottomSheetController.paymentResionIconValue.value,
        time: time,
        isIncome: bottomSheetController.isIncome.value,
      );
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accounts")
          .doc(accountSelected.value)
          .collection("transactions")
          .doc(id)
          .set(
            transactionModel.toJson(),
          );
      getTransactionList();
      accountCntroller.getAccount();
      setAccountDetails();
      successMessage("😍 Transaction Added");
      updateAccount(bottomSheetController.isIncome.value, amount);
      accountCntroller.getAccount();
      bottomSheetController.amountValue.value = "";
      bottomSheetController.comment.clear();
    }
    update();
  }

  Future deleteTransaction(String id) async {

    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .doc(id)
        .delete();
    
    getTransactionList();
    setAccountDetails();
    successMessage("🪲 Transaction Deleted");
  }

  Future updateAccount(bool isIncome, int newAmount) async {
    if (isIncome) {
      int newTotal = selectedAccountDetails.value.total! + newAmount;
      selectedAccountDetails.value.total = newTotal;
      selectedAccountDetails.value.income =
          selectedAccountDetails.value.income! + newAmount;
      print("Income");
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accounts")
          .doc(accountSelected.value)
          .update({
        "total": selectedAccountDetails.value.total,
        "income": selectedAccountDetails.value.income,
      });
    } else {
      int newTotal = selectedAccountDetails.value.total! - newAmount;
      selectedAccountDetails.value.total = newTotal;
      selectedAccountDetails.value.expense =
          selectedAccountDetails.value.expense! + newAmount;
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("accounts")
          .doc(accountSelected.value)
          .update({
        "total": selectedAccountDetails.value.total,
        "expense": selectedAccountDetails.value.expense,
      });
    }
    successMessage("🤑 Account Updated");
  }

  Future setAccountDetails() async {
    print("searching start");
    for (var element in accountCntroller.accountData) {
      if (element.name!.toLowerCase() == accountSelected.value) {
        selectedAccountDetails.value = element;
      }
    }
    print(selectedAccountDetails.value.name);
  }
}
