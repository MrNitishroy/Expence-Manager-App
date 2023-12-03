import 'package:expense_manager/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class EntryTile extends StatelessWidget {
  const EntryTile({super.key});

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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  onPressed: (conte) {},
                  backgroundColor: greenColor,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                ),
                SlidableAction(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onPressed: (s) {},
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_rounded,
                ),
              ]),
          child: Container(
            padding: EdgeInsets.all(15),
            // height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer),
      
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(100)),
                      child: SvgPicture.asset(
                        "Assets/Icons/expense.svg",
                        width: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Buy food items",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        // SizedBox(height: 4),
                        Text(
                          "18 jan 2023",
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
                Text(
                  "-234",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          )),
    );
  }
}
