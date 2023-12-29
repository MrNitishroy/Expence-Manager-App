import 'package:expense_manager/Controller/DbController.dart';
import 'package:expense_manager/Controller/GroupController.dart';
import 'package:expense_manager/Models/TransactionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Config/Colors.dart';

Future<dynamic> GroupTransactionDetails(
    TransactionModel e, BuildContext context, String groupId) {
  DbController dbController = Get.put(DbController());
  GroupController groupController = Get.put(GroupController());
  TextEditingController commentUpdateText = TextEditingController();
  return Get.defaultDialog(
      title: "Transaction Details",
      content: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("Assets/Icons/rupee.svg"),
                      const SizedBox(width: 10),
                      Text(
                        e.amount.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      e.isIncome!
                          ? Icon(
                              Icons.add,
                              size: 35,
                            )
                          : Icon(
                              Icons.remove,
                              size: 35,
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: paymentModeColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "Assets/Icons/bank.svg",
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                e.paymentType.toString().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                      Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: paymentResionColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "Assets/Icons/FoodIcon/food.svg",
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                e.category.toString().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Transaction Resion",
                    style: TextStyle(
                        fontSize: 12,
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: dbController.isCommentEditing.value
                              ? TextFormField(
                                  controller: commentUpdateText,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    filled: false,
                                  ),
                                )
                              : Text(
                                  e.comment.toString() == ""
                                      ? "No Resion"
                                      : e.comment.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                ),
                        ),
                        SizedBox(width: 10),
                        dbController.isCommentEditing.value
                            ? InkWell(
                                onTap: () async {
                                await  groupController.updateGroupTransaction(
                                      groupId,
                                      e.id.toString(),
                                      commentUpdateText.text);
                                  dbController.isCommentEditing.value = false;
                                },
                                child: Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 30,
                                  child: Icon(Icons.check, size: 18),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  dbController.isCommentEditing.value = true;
                                },
                                child: Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 30,
                                  child: Icon(Icons.edit_outlined, size: 18),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer,
                              size: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                          SizedBox(width: 10),
                          Text(
                            e.time.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,
                              size: 18,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                          SizedBox(width: 10),
                          Text(
                            "${e.date.toString()}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Transaction ID",
                    style: TextStyle(
                        fontSize: 12,
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                  Text(
                    e.id.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Created By ",
                    style: TextStyle(
                        fontSize: 12,
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 18,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      SizedBox(width: 10),
                      Text(
                        e.createdBy.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              "M A P",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
