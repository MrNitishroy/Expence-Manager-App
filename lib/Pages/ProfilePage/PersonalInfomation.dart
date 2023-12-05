import 'package:expense_manager/Controller/SettingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfomationTile extends StatelessWidget {
  const PersonalInfomationTile({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    return Obx(() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: ExpansionTile(
            initiallyExpanded: true,
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: Border(),
            leading: Icon(Icons.person),
            title: Text("Personal Infomation"),
            children: [
              ListTile(
                title: settingController.isNameEdit.value
                    ? const TextField(
                        decoration: InputDecoration(
                          filled: false,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Enter name",
                        ),
                      )
                    : Text("Nitish kumar"),
                leading: Icon(Icons.person),
                trailing: settingController.isNameEdit.value
                    ? InkWell(
                        onTap: () {
                          settingController.isNameEdit.value = false;
                        },
                        child: Icon(Icons.save))
                    : InkWell(
                        onTap: () {
                          settingController.isNameEdit.value = true;
                        },
                        child: Icon(Icons.edit)),
              ),
              ListTile(
                title: settingController.isEmailEdit.value
                    ? const TextField(
                        decoration: InputDecoration(
                          filled: false,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Enter email",
                        ),
                      )
                    : Text("Nitishr833@gmail.com"),
                leading: Icon(Icons.alternate_email_outlined),
                trailing: settingController.isEmailEdit.value
                    ? InkWell(
                        onTap: () {
                          settingController.isEmailEdit.value = false;
                        },
                        child: Icon(Icons.save))
                    : InkWell(
                        onTap: () {
                          settingController.isEmailEdit.value = true;
                        },
                        child: Icon(Icons.edit)),
              ),
              ListTile(
                title: settingController.isPasswordEdit.value
                    ? const TextField(
                        decoration: InputDecoration(
                          filled: false,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Enter password",
                        ),
                      )
                    : Text("**********"),
                leading: Icon(Icons.lock),
                trailing: settingController.isPasswordEdit.value
                    ? InkWell(
                        onTap: () {
                          settingController.isPasswordEdit.value = false;
                        },
                        child: Icon(Icons.save))
                    : InkWell(
                        onTap: () {
                          settingController.isPasswordEdit.value = true;
                        },
                        child: Icon(Icons.edit)),
              )
            ],
          ),
        ));
  }
}
