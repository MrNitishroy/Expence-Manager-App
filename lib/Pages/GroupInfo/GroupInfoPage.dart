import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Models/GroupModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupInfoPage extends StatelessWidget {
  final GroupModel groupInfo;
  const GroupInfoPage({super.key, required this.groupInfo});

  @override
  Widget build(BuildContext context) {
    AccountCntroller  accountCntroller = Get.put(AccountCntroller());
    return Scaffold(
        appBar: AppBar(
          title: Text(groupInfo.name!),
          actions: [
            groupInfo.admin == accountCntroller.currentUserData.value.email
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  )
                : SizedBox(),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        groupInfo.name![0].toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 40),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    groupInfo.name!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Members",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    Column(
                        children: groupInfo.members!
                            .map(
                              (e) => ListTile(
                                onTap: () {
                                  print(e.role);
                                },
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  child: Text(e.name![0].toUpperCase()),
                                ),
                                title: Text(e.name!),
                                subtitle: Text(
                                  e.email!,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                trailing: e.email == accountCntroller.currentUserData.value.email
                                    ? Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                      ),
                                      child: Text(
                                          "Admin",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                    )
                                    : Text(
                                        "Member",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      )
                              ),
                            )
                            .toList())
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
