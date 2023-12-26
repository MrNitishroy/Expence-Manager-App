import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Models/GroupModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:expense_manager/Models/TransactionModel.dart';
import 'package:expense_manager/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import 'BottomSheetController.dart';

class GroupController extends GetxController {
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  TextEditingController email = TextEditingController();
  TextEditingController groupName = TextEditingController();
  final db = FirebaseFirestore.instance;
  final uuid = Uuid();
  RxList<UserModel> groupMember = RxList<UserModel>([]);
  RxList<GroupModel> groupList = RxList<GroupModel>([]);
  RxList<GroupModel> yourGroupList = RxList<GroupModel>([]);
  RxList<TransactionModel> groupTransaction = RxList<TransactionModel>([]);
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGroup();
  }

  void findUsers() async {
    await db.collection("users").get().then((value) {
      for (var element in value.docs) {
        if (element.data()["email"] == email.text.toLowerCase()) {
          print(element.data());
          if (element.data()["email"] ==
              accountCntroller.currentUserData.value.email) {
            errorMessage("You can't add yourself");
            return;
          }
          groupMember.add(UserModel.fromJson(element.data()));
          email.clear();
          successMessage("User Found");
          return;
        }
      }
      errorMessage("User Not Found");
    });
  } // findUsers

  void createGroup() async {
    var addinGroupYourSelf = UserModel(
      id: accountCntroller.currentUserData.value.id,
      dob: accountCntroller.currentUserData.value.dob,
      password: accountCntroller.currentUserData.value.password,
      profile: accountCntroller.currentUserData.value.profile,
      number: accountCntroller.currentUserData.value.number,
      email: accountCntroller.currentUserData.value.email,
      name: accountCntroller.currentUserData.value.name,
      role: "admin",
    );
    groupMember.add(addinGroupYourSelf);
    isLoading.value = true;
    if (groupName.text.isEmpty) {
      errorMessage("Group Name is Empty");
      isLoading.value = false;
      return;
    }
    if (groupMember.isEmpty) {
      errorMessage("Group Member is Empty");
      isLoading.value = false;
      return;
    }
    String groupId = uuid.v4();
    successMessage("Group Created");
    await db.collection("groups").doc(groupId).set({
      "id": groupId,
      "name": groupName.text,
      "members": groupMember.map((e) => e.toJson()).toList(),
      "admin": accountCntroller.currentUserData.value.email,
    });
    groupMember.clear();
    groupName.clear();
    print("created");
    getGroup();
    isLoading.value = false;
  } // createGroup

  Future<void> getGroup() async {
    groupList.clear();
    isLoading.value = true;
    await db.collection("groups").get().then((value) {
      groupList.clear();
      for (var element in value.docs) {
        {
          groupList.add(GroupModel.fromJson(element.data()));
        }
      }
    });

    isLoading.value = false;
  }

  Future<void> getYourGroup() async {
    try {
      yourGroupList.clear();

      for (var group in groupList) {
        if (group.members != null &&
            (group.members!.any((member) =>
                    member.email!.toLowerCase() ==
                    accountCntroller.currentUserData.value.email) ||
                group.admin!.toLowerCase() ==
                    accountCntroller.currentUserData.value.email)) {
          // Check if the group is not already in yourGroupList
          if (!yourGroupList.contains(group)) {
            yourGroupList.add(group);
            print(group.name);
          }
        }
      }
      print("Your Group List: ${yourGroupList.length}");
    } catch (e) {
      print("Error in getYourGroup: $e");
    }
  }

  Future<void> addGroupTransation(BuildContext context, String groupId) async {
    String time = TimeOfDay.now().format(context);
    String date = DateFormat("dd MMM yyyy").format(
      DateTime.now(),
    );
    int amount = int.parse(bottomSheetController.amountValue.value);
    var newId = uuid.v4();
    var newTransaction = TransactionModel(
      id: newId,
      amount: amount,
      paymentType: bottomSheetController.paymentModeValue.value,
      category: bottomSheetController.paymentResionValue.value,
      comment: bottomSheetController.comment.text,
      date: date,
      iconPath: bottomSheetController.paymentResionIconValue.value,
      time: time,
      timestamp: DateTime.now(),
      isIncome: bottomSheetController.isIncome.value,
      createdBy: accountCntroller.currentUserData.value.email,
    );

    if (bottomSheetController.amountValue.value == "") {
      errorMessage("Amount is Empty");
      return;
    } else {
      await db
          .collection("groups")
          .doc(groupId)
          .collection("transactions")
          .doc(newId)
          .set(
            newTransaction.toJson(),
          );
      getGroupTransaction(groupId);
      successMessage("😍 Transaction Added To Group");
      bottomSheetController.amountValue.value = "";
      bottomSheetController.comment.clear();
    }
  }

  Future<void> getGroupTransaction(String groupId) async {
    groupTransaction.clear();
    try {
      await db
          .collection("groups")
          .doc(groupId)
          .collection("transactions")
          .orderBy("timestamp", descending: true)
          .get()
          .then((value) {
        for (var element in value.docs) {
          groupTransaction.add(TransactionModel.fromJson(element.data()));
        }
      });
    } catch (ex) {
      print(ex);
    }
  }
}
