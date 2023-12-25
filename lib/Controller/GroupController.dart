import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Models/GroupModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:expense_manager/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  TextEditingController email = TextEditingController();
  TextEditingController groupName = TextEditingController();
  final db = FirebaseFirestore.instance;
  final uuid = Uuid();
  RxList<UserModel> groupMember = RxList<UserModel>([]);
  RxList<GroupModel> groupList = RxList<GroupModel>([]);
  RxList<GroupModel> yourGroupList = RxList<GroupModel>([]);
  RxBool isLoading = false.obs;

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

  void getYourGroup() {
    yourGroupList.clear();
    try {
      for (var group in groupList) {
        if (group.members != null) {
          for (var member in group.members!) {
            if (member.email!.toLowerCase() == accountCntroller.currentUserData.value.email || group.admin!.toLowerCase() == accountCntroller.currentUserData.value.email) {
              yourGroupList.add(group);
              print(group.name);
            }
          }
        }
      }
    } catch (e) {
      print("Error in getYourGroup: $e");
    }
  }
}
