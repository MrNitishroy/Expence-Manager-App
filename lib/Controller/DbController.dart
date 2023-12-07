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

import 'BottomSheetController.dart';

class DbController extends GetxController {
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxString accountSelected = "personal".obs;

  RxList<TransactionModel> transactionList = RxList<TransactionModel>();
  Rx<AccountModel> selectedAccountDetails = Rx<AccountModel>(AccountModel());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTransactionList();

    accountCntroller.getAccount();
    Future.delayed(Duration(seconds: 1), () {
      setAccountDetails();
    });
  }

  void onAccountSelected() {
    getTransactionList();
    setAccountDetails();
  }

  void getTransactionList() async {
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
    setAccountDetails();
  }

  void addTransaction(BuildContext context) async {
    int amount = int.parse(bottomSheetController.amountValue.value);
    String time = TimeOfDay.now().format(context);
    String date = DateFormat("dd MMM yyyy").format(
      DateTime.now(),
    );
    var transactionModel = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      amount: amount,
      paymentType: bottomSheetController.paymentModeValue.value,
      category: bottomSheetController.paymentResionValue.value,
      comment: bottomSheetController.comment.text,
      date: date,
      iconPath: "",
      time: time,
      isIncome: bottomSheetController.isIncome.value,
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .add(
          transactionModel.toJson(),
        );
    getTransactionList();
    successMessage("😍 Transaction Added");
    updateAccount(bottomSheetController.isIncome.value, amount);
    accountCntroller.getAccount();
  }

  void deleteTransaction(String id) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .doc(id)
        .delete();
    successMessage("🪲 Transaction Deleted");
  }



  void updateAccount(bool isIncome, int newAmount) async {
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

  void setAccountDetails() {
    print("searching start");
    for (var element in accountCntroller.accountData) {
      if (element.name!.toLowerCase() == accountSelected.value) {
        selectedAccountDetails.value = element;
      }
    }
    print(selectedAccountDetails.value.name);
  }
}
