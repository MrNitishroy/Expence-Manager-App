import 'package:expense_manager/Components/BottomNaviagtion.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Pages/HomePage/Widget/Card.dart';
import 'package:expense_manager/Pages/HomePage/Widget/EntryTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Container(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset("Assets/Icons/menu.svg"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigation(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
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
                            Text(
                              "INCOME",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer),
                            ),
                            Text(
                              "23543",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
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
                        SizedBox(width: 10),
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
                            Text(
                              "23543",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
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
            const Column(
              children: [
                EntryTile(),
                EntryTile(),
                EntryTile(),
                EntryTile(),
                EntryTile(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
