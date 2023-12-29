import 'package:expense_manager/Controller/GroupController.dart';
import 'package:expense_manager/Pages/GroupTransaction/GroupTransactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Group Page"),
        actions: [
          IconButton(
              onPressed: () {
                groupController.onRefresh();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                // height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("Assets/Icons/group.svg"),
                              SizedBox(width: 10),
                              Text("New Group Info"),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: groupController.groupName,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Group Name",
                              prefixIcon: Icon(
                                Icons.group,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: groupController.email,
                                  decoration: const InputDecoration(
                                    hintText: "Member Email",
                                    prefixIcon: Icon(
                                      Icons.alternate_email_outlined,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  groupController.findUsers();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    "Assets/Icons/donw.svg",
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Member list",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => Column(
                              children: groupController.groupMember.map((e) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    child: Text("A"),
                                  ),
                                  title: Text(e.email! ?? "No Email"),
                                  trailing: InkWell(
                                    onTap: () {
                                      groupController.removeUser(e);
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // ListTile(
                          //   leading: CircleAvatar(
                          //     backgroundColor:
                          //         Theme.of(context).colorScheme.primary,
                          //     child: Text("A"),
                          //   ),
                          //   title: Text("Nroy7033@gmail.com"),
                          //   trailing: InkWell(
                          //       onTap: () {}, child: Icon(Icons.delete)),
                          // ),

                          SizedBox(height: 20),
                          Obx(
                            () => groupController.isLoading.value
                                ? const CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      groupController.createGroup();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "CREATE GROUP",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ),
                                  ),
                          ),
                          // InkWell(
                          //           onTap: () {
                          //             groupController.createGroup();
                          //           },
                          //           child: Container(
                          //             padding: EdgeInsets.symmetric(
                          //                 vertical: 10, horizontal: 20),
                          //             decoration: BoxDecoration(
                          //               color: Theme.of(context)
                          //                   .colorScheme
                          //                   .primary,
                          //               borderRadius: BorderRadius.circular(10),
                          //             ),
                          //             child: Text(
                          //               "CREATE GROUP",
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .bodyLarge,
                          //             ),
                          //           ),
                          //         ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("Assets/Icons/group.svg"),
                              SizedBox(width: 10),
                              Text("All Your Groups"),
                            ],
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => Column(
                              children: groupController.yourGroupList.map((e) {
                                return ListTile(
                                  onTap: (){
                                    groupController.getGroupTransaction(e.id!);
                                    Get.to(GroupTransaction(groupModel: e,),transition: Transition.rightToLeftWithFade);
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    child: Text(e.name![0].toUpperCase()),
                                  ),
                                  title: Text(e.name!),
                                  trailing: InkWell(
                                      onTap: () {}, child: Icon(Icons.delete)),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
