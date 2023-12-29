import 'package:expense_manager/Components/GroupBottomNavigation.dart';
import 'package:expense_manager/Controller/GroupController.dart';
import 'package:expense_manager/Models/GroupModel.dart';
import 'package:expense_manager/Pages/GroupInfo/GroupInfoPage.dart';
import 'package:expense_manager/Pages/HomePage/Widget/EntryTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GroupTransaction extends StatelessWidget {
  final GroupModel groupModel;
  const GroupTransaction({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              groupController.findGroupIncomeandExpense(groupModel.id!);
              Get.to(GroupInfoPage(
                groupInfo: groupModel,
              ),
              transition: Transition.rightToLeft
              );
            },
            child: Row(
              children: [
                Text(groupModel.name!),
              ],
            )),
        actions: [
          Icon(
            Icons.more_vert_rounded,
          ),
        ],
      ),
      bottomNavigationBar: GroupBottomNavigation(
        groupId: groupModel.id!,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator(
            child: Obx(
              () => ListView(
                children: groupController.groupTransaction
                    .map(
                      (e) => EntryTile(
                        id: e.id.toString(),
                        onTap: () {},
                        icon: e.iconPath.toString(),
                        amount: e.amount.toString(),
                        comment: e.comment.toString(),
                        date: e.date.toString(),
                        isIncome: e.isIncome!,
                        time: e.time.toString(),
                      ),
                    )
                    .toList(),
              ),
            ),
            onRefresh: () async {
              groupController.getGroupTransaction(groupModel.id!);
            }),
      ),
    );
  }
}
