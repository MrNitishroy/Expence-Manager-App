import 'package:expense_manager/Pages/HomePage/Widget/Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/CreditcardController.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    CreditcardController creditcardController = Get.put(CreditcardController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: ExpansionTile(
        
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shape: Border(),
        leading: SvgPicture.asset(
          "Assets/Icons/bank.svg",
          color: Theme.of(context).colorScheme.onBackground,
        ),
        title: Text("Your Accounts"),
        children: [
          Column(
              children: creditcardController.accountData
                  .map(
                    (e) => ListTile(
                        title: Text(e.name!),
                        leading: SvgPicture.asset(
                          "Assets/Icons/bank.svg",
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        trailing: SizedBox(
                          width: 70,
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.delete_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ],
                          ),
                        )),
                  )
                  .toList()),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.add),
                const SizedBox(width: 10),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    filled: false,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: "Add New Account",
                  ),
                )),
                InkWell(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset("Assets/Icons/donw.svg"),
                  ),
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
