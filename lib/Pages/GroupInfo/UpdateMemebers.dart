import 'package:expense_manager/Controller/GroupController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> UpdateMember(String id) {
  TextEditingController email = TextEditingController();
  GroupController groupController = Get.put(GroupController());
  return Get.defaultDialog(
    title: "Add member",
    content: Column(
      children: [
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Member Email",
            prefixIcon: Icon(
              Icons.alternate_email_outlined,
            ),
          ),
        ),
      ],
    ),
    confirm: ElevatedButton(
      onPressed: () {
        groupController.updateGroupMember(id, email.text);
      },
      child: Text("Add"),
    ),
    cancel: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text("Cancel"),
    ),
  );
}
