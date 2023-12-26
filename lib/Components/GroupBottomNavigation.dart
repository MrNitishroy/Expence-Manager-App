import 'package:expense_manager/Components/BottomSheetComponets.dart';
import 'package:expense_manager/Components/GroupBottomSheet.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/BottomSheetController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GroupBottomNavigation extends StatelessWidget {
  final String groupId;
  const GroupBottomNavigation({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    BottomSheetController bottomSheetController =
        Get.put(BottomSheetController());
    return Container(
      // color: Colors.red,
      height: 60,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Get.bottomSheet(
                  GroupBottomSheet(
                    groupId: groupId,
                    isIncome: true,
                  ),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100),
                  ),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: SvgPicture.asset("Assets/Icons/income.svg"),
                    ),
                    SizedBox(width: 10),
                    const Text(
                      "INCOME",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.bottomSheet(
                  GroupBottomSheet(
                    groupId: groupId,
                    isIncome: false,
                  ),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "EXPENSE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100)),
                      child: SvgPicture.asset("Assets/Icons/expense.svg"),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
