import 'package:expense_manager/Controller/IconPickerController.dart';
import 'package:expense_manager/Pages/HomePage/Widget/Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Controller/AccountController.dart';
import '../../Controller/CreditcardController.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    CreditcardController creditcardController = Get.put(CreditcardController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    IconPickerController iconPickerController = Get.put(IconPickerController());
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
          Obx(
            () => Column(
              children: accountCntroller.accountData
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
                              InkWell(
                                onTap: () {
                                  accountCntroller.deleteAccount(e.name!);
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () async {
                      iconPickerController.accountIconSelector(context);
                    },
                    child: Obx(
                      () => Container(
                        child: Row(children: [
                          SvgPicture.asset(iconPickerController
                              .accountSelectedIconvalue.value),
                          Icon(Icons.arrow_drop_down)
                        ]),
                      ),
                    )),
                const SizedBox(width: 10),
                Expanded(
                    child: TextField(
                  controller: accountCntroller.accountName,
                  decoration: const InputDecoration(
                    filled: false,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: "Add New Account",
                  ),
                )),
                InkWell(
                  onTap: () {
                    accountCntroller.addNewAccount(context);
                  },
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
