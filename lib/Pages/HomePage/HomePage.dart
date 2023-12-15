import 'package:expense_manager/Components/BottomNaviagtion.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Controller/DbController.dart';
import 'package:expense_manager/Pages/HomePage/Widget/Card.dart';
import 'package:expense_manager/Pages/HomePage/Widget/EntryTile.dart';
import 'package:expense_manager/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    DbController dbController = Get.put(DbController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        primary: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Obx(
            () => dbController.isLoading.value
                ? LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  )
                : SizedBox(),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SvgPicture.asset("Assets/Icons/logo.svg"),
            ),
            SizedBox(width: 10),
            const Text(
              "UNIWALT",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.7),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              // authController.logOut();
              Get.to(ProfilePage());
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset("Assets/Icons/menu.svg"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigation(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: () async {
              dbController.onPageRefresh();
            },
            child: ListView(
              children: [
                const SizedBox(height: 10),
                const CreditCard(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(100)),
                              child:
                                  SvgPicture.asset("Assets/Icons/income.svg"),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "INCOME",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                                ),
                                Obx(
                                  () => dbController.selectedAccountDetails
                                              .value.income ==
                                          null
                                      ? Text("Loading..")
                                      : Text(
                                          "${dbController.selectedAccountDetails.value.income}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(100)),
                              child:
                                  SvgPicture.asset("Assets/Icons/expense.svg"),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "EXPENSE",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer),
                                ),
                                Obx(
                                  () => dbController.selectedAccountDetails
                                              .value.expense ==
                                          null
                                      ? Text("Loading..")
                                      : Text(
                                          "${dbController.selectedAccountDetails.value.expense}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text("TODAY"),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Column(
                    children: dbController.transactionList
                        .map(
                          (e) => EntryTile(
                            id: e.id.toString(),
                            onTap: () {},
                            icon: e.iconPath.toString(),
                            amount: e.amount.toString(),
                            comment: e.comment.toString(),
                            date: e.date.toString(),
                            isIncome: e.isIncome!,
                            time: e.time.toString(),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
