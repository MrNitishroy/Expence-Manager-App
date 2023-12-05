import 'package:cloud_firestore/cloud_firestore.dart';
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
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxString accountSelected = "personal".obs;
  RxList<TransactionModel> transactionList = RxList<TransactionModel>();
  RxList<AccountModel> accountList = RxList<AccountModel>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTransactionList();
  }

  void getTransactionList() async {
    transactionList.clear();
    db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        transactionList.add(TransactionModel.fromJson(element.data()));
      });
    });
  }

  void addTransaction(BuildContext context) async {
    String time = TimeOfDay.now().format(context);
    String date = DateFormat("dd MMM yyyy").format(
      DateTime.now(),
    );

    var transactionModel = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      amount: 23,
      paymentType: bottomSheetController.paymentModeValue.value,
      category: bottomSheetController.paymentResionValue.value,
      comment: bottomSheetController.comment.text,
      date: DateTime.now().toString(),
      iconPath: "",
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
    successMessage("😍 Transaction Added");
  }

  void getAccountsList() async {
    accountList.clear();
    db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accountsList")
        .get()
        .then((value) {
      for (var element in value.docs) {
        accountList.add(AccountModel.fromJson(element.data()));
      }
    });
  }

  void addNewAccount(BuildContext context) async {
    var newAccount = AccountModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: bottomSheetController.comment.text,
      expense: 0,
      income: 0,
      total: 0,
      time:  TimeOfDay.now().format(context),
      date: DateFormat("dd MMM yyyy").format(
        DateTime.now(),
      ),
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accountsList")
        .add(
          newAccount.toJson(),
        );
    successMessage("😍 Transaction Added");
  }
}
