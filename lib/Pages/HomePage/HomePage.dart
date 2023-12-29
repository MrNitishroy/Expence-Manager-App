import 'package:expense_manager/Components/BottomNaviagtion.dart';
import 'package:expense_manager/Components/MyDrawer.dart';
import 'package:expense_manager/Components/TransactionDetails.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/AppController.dart';
import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Controller/DbController.dart';
import 'package:expense_manager/Controller/GroupController.dart';
import 'package:expense_manager/Controller/NotificationController.dart';
import 'package:expense_manager/Pages/HomePage/Widget/Card.dart';
import 'package:expense_manager/Pages/HomePage/Widget/EntryTile.dart';
import 'package:expense_manager/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    DbController dbController = Get.put(DbController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    NotificationController notificationController =
        Get.put(NotificationController());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      endDrawer: Container(
        child: MyDrawer(context),
        width: 350,
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
              Obx(
                () => dbController.isLoading.value
                    ? LinearProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      )
                    : SizedBox(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (context) => InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SvgPicture.asset("Assets/Icons/logo.svg"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "UNI-WALLETS",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        // authController.logOut();
                        // Get.toNamed("/profilePage");
                        groupController.getYourGroup();
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          "Assets/Icons/menu.svg",
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
                            child: SvgPicture.asset("Assets/Icons/income.svg"),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("INCOME",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Obx(
                                () => dbController.selectedAccountDetails.value
                                            .income ==
                                        null
                                    ? Text("Loading..")
                                    : Text(
                                        "${dbController.selectedAccountDetails.value.income}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
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
                            child: SvgPicture.asset("Assets/Icons/expense.svg"),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("EXPENSE",
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                              Obx(
                                () => dbController.selectedAccountDetails.value
                                            .expense ==
                                        null
                                    ? Text("Loading..")
                                    : Text(
                                        "${dbController.selectedAccountDetails.value.expense}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
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
              Row(
                children: [
                  Text(
                    "TODAY",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            Theme.of(context).colorScheme.secondaryContainer),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () => Column(
                  children: dbController.transactionList
                      .map(
                        (e) => EntryTile(
                          id: e.id.toString(),
                          onTap: () {
                            TransactionDetails(context, e);
                          },
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
        ),
      ),
    );
  }
}
