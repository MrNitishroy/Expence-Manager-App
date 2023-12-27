import 'package:expense_manager/Components/BottomSheetComponets.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/GroupController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ExpenseAndIncome extends StatelessWidget {
  final String groupId;
  const ExpenseAndIncome({
    super.key,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("Assets/Icons/income.svg"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("INCOME",
                        style: Theme.of(context).textTheme.labelSmall),
                    Obx(
                      () => Text("${groupController.groupIncome.value}",
                          style: Theme.of(context).textTheme.headlineMedium),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("Assets/Icons/expense.svg"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("EXPENSE",
                        style: Theme.of(context).textTheme.labelSmall),
                    Obx(
                      () => Text("${groupController.groupExpense.value}",
                          style: Theme.of(context).textTheme.headlineMedium),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
