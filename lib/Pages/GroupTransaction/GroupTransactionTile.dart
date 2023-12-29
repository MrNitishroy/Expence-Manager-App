import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/DbController.dart';
import 'package:expense_manager/Models/TransactionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GroupTransactionTile extends StatelessWidget {
  final TransactionModel transactionModel;
  final VoidCallback onTap;
  const GroupTransactionTile({
    super.key,

    required this.onTap, required this.transactionModel,
  });

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: transactionModel.isIncome!
                            ? greenColor
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100)),
                    child: SvgPicture.asset(
                      transactionModel.iconPath!,
                      width: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(transactionModel.comment!,
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          SvgPicture.asset("Assets/Icons/clock.svg"),
                          SizedBox(width: 4),
                          Text(
                            transactionModel.time!,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SvgPicture.asset("Assets/Icons/calender.svg"),
                          SizedBox(width: 4),
                          Text(
                            transactionModel.createdBy!,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          SizedBox(width: 10),
                          
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  transactionModel.isIncome!
                      ? Text("+",
                          style: Theme.of(context).textTheme.headlineMedium)
                      : Text(
                          "-",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                  Text(transactionModel.amount.toString(),
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              )
            ],
          ),
        ),
      ),
      // child: Slidable(
      //     endActionPane: ActionPane(
      //         motion: const ScrollMotion(),
      //         extentRatio: 0.2,
      //         children: [
      //           SlidableAction(
      //             borderRadius: const BorderRadius.only(
      //                 topLeft: Radius.circular(10),
      //                 bottomLeft: Radius.circular(10)),
      //             onPressed: (conte) {},
      //             backgroundColor: greenColor,
      //             foregroundColor: Colors.white,
      //             icon: Icons.edit,
      //           ),
      //           // SlidableAction(
      //           //   borderRadius: const BorderRadius.only(
      //           //     topRight: Radius.circular(10),
      //           //     bottomRight: Radius.circular(10),
      //           //   ),
      //           //   onPressed: (s) {
      //           //     dbController.deleteTransaction(id);
      //           //   },
      //           //   backgroundColor: Theme.of(context).colorScheme.primary,
      //           //   foregroundColor: Colors.white,
      //           //   icon: Icons.delete_rounded,
      //           // ),
      //         ]),
      //     child: ),
    );
  }
}
