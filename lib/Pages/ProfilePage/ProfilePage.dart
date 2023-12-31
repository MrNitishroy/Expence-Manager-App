import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Controller/ThemeController.dart';
import 'package:expense_manager/Pages/GroupPage/GroupTile.dart';
import 'package:expense_manager/Pages/ProfilePage/AccountTile.dart';
import 'package:expense_manager/Pages/ProfilePage/CategoryTile.dart';
import 'package:expense_manager/Pages/GroupPage/GroupPage.dart';
import 'package:expense_manager/Pages/ProfilePage/PaymentMode.dart';
import 'package:expense_manager/Pages/ProfilePage/PersonalInfomation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Controller/IconPickerController.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ThemeController themeController = Get.put(ThemeController());
    IconPickerController iconPickerController = Get.put(IconPickerController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: ListView(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Get.back();
              },
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios_new),
                  SizedBox(width: 10),
                  Text(
                    "Setting",
                    style: TextStyle(fontSize: 32),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            PersonalInfomationTile(),
            SizedBox(height: 10),
            CategoryTile(),
            SizedBox(height: 10),
            PaymentTile(),
            SizedBox(height: 10),
            AccountTile(),
            SizedBox(height: 10),
            GroupTile(),
            SizedBox(height: 80),
            // ElevatedButton(
            //   onPressed: () async {
            //     Get.to(GroupPage());
            //   },
            //   child: Text("Goup Page"),
            // ),
            Obx(
              () => ListTile(
                title: themeController.isDark.value
                    ? Text("Dark Mode")
                    : Text("Light Mode"),
                trailing: Switch(
                  value: themeController.isDark.value,
                  onChanged: (value) {
                    themeController.isDark.value = value;
                    Get.changeThemeMode(themeController.isDark.value
                        ? ThemeMode.dark
                        : ThemeMode.light);
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                ),
                leading: Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                authController.logOut();
              },
              title: Text("Log out"),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
       

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("Assets/Icons/logoBananner.svg"),
              ],
            )
          ],
        )),
      ),
    );
  }
}
