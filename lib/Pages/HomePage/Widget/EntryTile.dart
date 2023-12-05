import 'package:expense_manager/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class EntryTile extends StatelessWidget {
  final String comment;
  final String date;
  final bool isIncome;
  final String amount;
  const EntryTile({
    super.key,
    required this.comment,
    required this.date,
    required this.isIncome,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Slidable(
          endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.4,
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  onPressed: (conte) {},
                  backgroundColor: greenColor,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                ),
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  onPressed: (s) {},
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_rounded,
                ),
              ]),
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: isIncome
                              ? greenColor
                              : Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100)),
                      child: SvgPicture.asset(
                        "Assets/Icons/FoodIcon/food1.svg",
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
                        Text(
                          date,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
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
          )),
    );
  }
}
