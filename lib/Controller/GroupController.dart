import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Models/GroupModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:expense_manager/Models/TransactionModel.dart';
import 'package:expense_manager/Models/UserModel.dart';
import 'package:expense_manager/Pages/HomePage/HomePage.dart';
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
  RxString groupIncome = "0".obs;
  RxString groupExpense = "0".obs;
  RxBool isLoading = false.obs;
  RxBool isGroupDetailsLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGroup();
  }

  Future<void> onRefresh() async {
    await getGroup();
    await getYourGroup();
  }

  Future findGroupIncomeandExpense(String groupId) async {
    isGroupDetailsLoading.value = true;
    await db.collection("groups").doc(groupId).get().then((value) {
      groupIncome.value = value.data()!["income"].toString();
      groupExpense.value = value.data()!["expense"].toString();
    });
    isGroupDetailsLoading.value = false;
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

  Future<void> updateGroupMember(String groupId, String email) async {
    await db.collection("users").get().then((value) {
      for (var e in value.docs) {
        if (e.data()["email"] == email.toLowerCase()) {
          print(e.data());
          if (e.data()["email"] ==
              accountCntroller.currentUserData.value.email) {
            errorMessage("You can't add yourself");
            return;
          }

          db.collection("groups").doc(groupId).update({
            "members": FieldValue.arrayUnion([e.data()]),
          });
          successMessage("Member added");
          getGroupTransaction(groupId);
          Get.back();

          return;
        }
      }
      errorMessage("User Not Found");
    });

    successMessage("User Added");
    await onRefresh();
  }

  void removeUser(UserModel user) {
    groupMember.remove(user);
  }

  void createGroup() async {
    isLoading.value = true;
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
    await db.collection("groups").doc(groupId).set(
      {
        "id": groupId,
        "name": groupName.text,
        "members": groupMember.map((e) => e.toJson()).toList(),
        "admin": accountCntroller.currentUserData.value.email,
        "income": 0,
        "expense": 0,
      },
    );
    groupMember.clear();
    groupName.clear();
    print("created");
    await onRefresh();

    isLoading.value = false;
  }

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
      if (bottomSheetController.isIncome.value) {
        await db
            .collection("groups")
            .doc(groupId)
            .collection("transactions")
            .doc(newId)
            .set(
              newTransaction.toJson(),
            );
        await db.collection("groups").doc(groupId).update({
          "income": FieldValue.increment(amount),
        });
      } else {
        await db
            .collection("groups")
            .doc(groupId)
            .collection("transactions")
            .doc(newId)
            .set(
              newTransaction.toJson(),
            );
        await db.collection("groups").doc(groupId).update({
          "expense": FieldValue.increment(amount),
        });
      }
      getGroupTransaction(groupId);
      successMessage("😍 Transaction Added To Group");
      bottomSheetController.amountValue.value = "";
      bottomSheetController.comment.clear();
      await onRefresh();
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

  Future<void> deleteGroup(String id) async {
    await db.collection("groups").doc(id).delete();
    getGroup();
    Get.offAll(HomePage());
    successMessage("Group Deleted");
  }

  Future<void> updateGroupTransaction(
      String groupid, String transactionid, String resion) async {
    await db
        .collection("groups")
        .doc(groupid)
        .collection("transactions")
        .doc(transactionid)
        .update(
      {
        "comment": resion,
      },
    );
    Get.back();
    getGroupTransaction(groupid);
    successMessage("😍 Transaction Updated");
  }
}
