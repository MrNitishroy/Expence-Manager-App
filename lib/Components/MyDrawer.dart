import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Pages/AboutUs/AboutUsPage.dart';
import 'package:expense_manager/Pages/BugPage/BugPage.dart';
import 'package:expense_manager/Pages/GroupPage/GroupPage.dart';
import 'package:expense_manager/Pages/GroupPage/GroupTile.dart';
import 'package:expense_manager/Pages/GroupTransaction/GroupTransactionPage.dart';
import 'package:expense_manager/Pages/ProfilePage/AccountTile.dart';
import 'package:expense_manager/Pages/ProfilePage/CategoryTile.dart';
import 'package:expense_manager/Pages/ProfilePage/PaymentMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../Controller/GroupController.dart';
import '../Pages/ProfilePage/ProfilePage.dart';

MyDrawer(BuildContext context) {
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  GroupController groupController = Get.put(GroupController());
  return Drawer(
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    child: Container(
      // width: 400,
      padding: EdgeInsets.all(7),
      child: ListView(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.toNamed("/profilePage");
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: Image.asset("Assets/Photos/Profile.png"),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello 🤚"),
                      Container(
                        width: 250,
                        child: Obx(
                          () => Text(
                            accountCntroller.currentUserData.value.name == null
                                ? "Add Name"
                                : accountCntroller.currentUserData.value.name!,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "All Group",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 5),
          GroupTile(),
          SizedBox(height: 10),
          Text(
            "All Options",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 5),
          CategoryTile(),
          SizedBox(height: 5),
          PaymentTile(),
          SizedBox(height: 5),
          AccountTile(),
          SizedBox(height: 50),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.update_outlined,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Future Update",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              Get.to(
                  AboutUsPage(
                    version: packageInfo.version.toString(),
                  ),
                  transition: Transition.rightToLeftWithFade);
            },
            leading: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "About us",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(BugPage(), transition: Transition.rightToLeftWithFade);
            },
            leading: Icon(
              Icons.bug_report_outlined,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Report",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("Assets/Icons/logoBananner.svg"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Made with ❤️ by - Nitish roy",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
