import 'package:expense_manager/Config/Colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios_new),
                SizedBox(width: 10),
                Text(
                  "Setting",
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.person),
              title: Text("Personal Details"),
              trailing: Icon(Icons.arrow_drop_down),
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: darkDivColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance_outlined),
                            SizedBox(width: 10),
                            Text(
                              "Your Accounts",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Personal"),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
