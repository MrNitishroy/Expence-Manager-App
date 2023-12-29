import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Controller/GroupController.dart';
import 'package:expense_manager/Controller/IconPickerController.dart';
import 'package:expense_manager/Pages/GroupPage/GroupPage.dart';
import 'package:expense_manager/Pages/HomePage/Widget/Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/AccountController.dart';
import '../../Controller/CreditcardController.dart';
import '../GroupTransaction/GroupTransactionPage.dart';

class GroupTile extends StatelessWidget {
  const GroupTile({super.key});

  @override
  Widget build(BuildContext context) {
    CreditcardController creditcardController = Get.put(CreditcardController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    IconPickerController iconPickerController = Get.put(IconPickerController());
    GroupController groupController = Get.put(GroupController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shape: Border(),
        leading: SvgPicture.asset(
          "Assets/Icons/group.svg",
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text("Your Groups"),
        children: [
          Obx(
            () => Column(
              children: groupController.yourGroupList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        tileColor: Theme.of(context).colorScheme.background,
                        selectedColor:Theme.of(context).colorScheme.background ,
                        selectedTileColor: Theme.of(context).colorScheme.background,
                        onTap: () {
                          groupController.getGroupTransaction(e.id!);
                          print("Group Id: ${e.id}");
                          Get.to(
                            GroupTransaction(
                              groupModel: e,
                            ),
                            transition: Transition.rightToLeft,
                          );
                        },
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text(e.name![0].toUpperCase()),
                        ),
                        title: Text(e.name!),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(GroupPage(),transition: Transition.rightToLeftWithFade);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        "NEW GROUP",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                ),
                SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
