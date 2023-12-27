import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/GroupController.dart';
import 'package:expense_manager/Models/GroupModel.dart';
import 'package:expense_manager/Pages/GroupInfo/Widgets/ExpanseAndIncome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Components/DeleteAleartDialogBox.dart';

class GroupInfoPage extends StatelessWidget {
  final GroupModel groupInfo;
  const GroupInfoPage({super.key, required this.groupInfo});

  @override
  Widget build(BuildContext context) {
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
        appBar: AppBar(
          title: Text(groupInfo.name!),
          actions: [
            groupInfo.admin == accountCntroller.currentUserData.value.email
                ? IconButton(
                    onPressed: () {
                      DeleteDialogBox(context, groupController, groupInfo.id!);
                    },
                    icon: Icon(Icons.delete),
                  )
                : SizedBox(),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 0),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "THIS MONTH EXPENSE",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "Assets/Icons/rupee.svg",
                                  color:
                                      Theme.of(context).colorScheme.onBackground,
                                ),
                                const SizedBox(width: 10),
                                Obx(() => Text(
                                      "${groupController.groupExpense.value}",
                                      style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ExpenseAndIncome(
                  groupId: groupInfo.id!,
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Members",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Column(
                          children: groupInfo.members!
                              .map(
                                (e) => ListTile(
                                    onTap: () {
                                      print(e.role);
                                    },
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      child: Text("A"),
                                    ),
                                    title: Text(e.name ?? "No Name"),
                                    subtitle: Text(
                                      e.email!,
                                      style:
                                          Theme.of(context).textTheme.labelSmall,
                                    ),
                                    trailing: e.email ==
                                            accountCntroller
                                                .currentUserData.value.email
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primaryContainer,
                                            ),
                                            child: Text(
                                              "Admin",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          )
                                        : Text(
                                            "Member",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          )),
                              )
                              .toList())
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
