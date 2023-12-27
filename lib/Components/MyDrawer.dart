import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Pages/GroupPage/GroupPage.dart';
import 'package:expense_manager/Pages/GroupPage/GroupTile.dart';
import 'package:expense_manager/Pages/GroupTransaction/GroupTransactionPage.dart';
import 'package:expense_manager/Pages/ProfilePage/AccountTile.dart';
import 'package:expense_manager/Pages/ProfilePage/CategoryTile.dart';
import 'package:expense_manager/Pages/ProfilePage/PaymentMode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Get.to(ProfilePage());
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
          SizedBox(height: 10),
          // Text(
          //   "All Groups",
          //   style: Theme.of(context).textTheme.labelSmall,
          // ),
          // SizedBox(height: 5),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         Get.to(GroupPage());
          //       },
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //         decoration: BoxDecoration(
          //           color: Theme.of(context).colorScheme.primary,
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: Row(
          //           children: [
          //             Icon(Icons.add),
          //             Text(
          //               "New Group",
          //               style: Theme.of(context).textTheme.bodyLarge,
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 10),
          // SizedBox(
          //   height: 200,
          //   child: Obx(
          //     () => ListView(
          //       children: groupController.yourGroupList
          //           .map(
          //             (element) => ListTile(
          //               onTap: () {
          //                 groupController.getGroupTransaction(element.id!);
          //                 print("Group Id: ${element.id}");
          //                 Get.to(
          //                   GroupTransaction(
          //                     groupModel: element,
          //                   ),
          //                 );
          //               },
          //               leading: CircleAvatar(
          //                 backgroundColor:
          //                     Theme.of(context).colorScheme.primary,
          //                 child: Text(element.name![0].toUpperCase()),
          //               ),
          //               title: Text(element.name!),
          //             ),
          //           )
          //           .toList(),
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}
