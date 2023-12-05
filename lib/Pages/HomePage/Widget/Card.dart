import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/CreditcardController.dart';
import 'package:expense_manager/Controller/DbController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    CreditcardController creditcardController =
        Get.put(CreditcardController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    DbController dbController = Get.put(DbController());
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("Assets/Icons/logo.svg"),
                      SizedBox(width: 10),
                      const Text(
                        "5423.00",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                  Obx(() => DropdownButton(
                    underline: SizedBox(),
                    dropdownColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    elevation: 0,
                    value: dbController.accountSelected.value,
                    hint: Text("Select Account"),
                    enableFeedback: true,
                    borderRadius: BorderRadius.circular(10),
                    items: accountCntroller.accountData
                        .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text("${e.name}"),
                            ))
                        .toList(),
                    onChanged: (selected) {
                      dbController.accountSelected.value = selected.toString();
                    },
                  ))
                ],
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "Total Balance",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                height: 10,
                child: Row(children: [
                  AnimatedContainer(
                    duration: Duration(microseconds: 200),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ]),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                  Text(
                    "54230",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
