import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/DbController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EntryTile extends StatelessWidget {
  final String id;
  final String comment;
  final String date;
  final bool isIncome;
  final String icon;
  final String amount;
  final String time;
  final VoidCallback onTap;
  const EntryTile({
    super.key,
    required this.icon,
    required this.id,
    required this.time,
    required this.comment,
    required this.date,
    required this.isIncome,
    required this.amount, required this.onTap,
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
                            color: isIncome
                                ? greenColor
                                : Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(
                          icon,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            comment,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("Assets/Icons/calender.svg"),
                              SizedBox(width: 4),
                              Text(
                                date,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer),
                              ),
                              SizedBox(width: 10),
                                SvgPicture.asset("Assets/Icons/clock.svg"),
                              SizedBox(width: 4),
                              Text(
                                time,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      isIncome ? const Text(
                        "+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ):const Text(
                        "-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        amount,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
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
