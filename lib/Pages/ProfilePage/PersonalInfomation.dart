import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Controller/SettingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfomationTile extends StatelessWidget {
  const PersonalInfomationTile({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    AuthController authController = Get.put(AuthController());

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
                    ? TextField(
                        controller: authController.nameController,
                        decoration: InputDecoration(
                          filled: false,
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Enter name",
                        ),
                      )
                    : accountCntroller.currentUserData.value.name == null
                        ? accountCntroller.currentUserData.value.name == null
                            ? Text("User Name")
                            : Text(accountCntroller.currentUserData.value.name!)
                        : Text(accountCntroller.currentUserData.value.name!),
                leading: Icon(Icons.person),
                trailing: settingController.isNameEdit.value
                    ? InkWell(
                        onTap: () {
                          authController.updateUserName();
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
                title: Text(accountCntroller.currentUserData.value.email!),
                leading: Icon(Icons.alternate_email_outlined),
              ),
              ListTile(
                title: settingController.isPasswordEdit.value
                    ? accountCntroller.currentUserData.value.password == null
                        ? Text("No paswword shaved")
                        : Text(authController.paswordSaved.value)
                    : Text("**********"),
                leading: Icon(Icons.lock),
                trailing: settingController.isPasswordEdit.value
                    ? InkWell(
                        onTap: () {
                          settingController.isPasswordEdit.value = false;
                        },
                        child: Icon(Icons.remove_red_eye))
                    : InkWell(
                        onTap: () {
                          settingController.isPasswordEdit.value = true;
                        },
                        child: Icon(Icons.visibility_off),
                      ),
              )
            ],
          ),
        ));
  }
}
