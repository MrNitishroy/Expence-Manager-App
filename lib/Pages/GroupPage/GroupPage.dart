import 'package:expense_manager/Controller/GroupController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Page"),
        actions: [
          IconButton(
              onPressed: () {
                groupController.getGroup();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Group Page"),
              SizedBox(height: 20),
              TextFormField(
                controller: groupController.groupName,
                decoration: InputDecoration(
                  hintText: "Group Name",
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: groupController.email,
                decoration: InputDecoration(
                  hintText: "Group Name",
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  suffix: IconButton(
                    onPressed: () {
                      groupController.findUsers();
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Added Members"),
              Obx(
                () => Column(
                  children: groupController.groupMember.map((e) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("A"),
                      ),
                      title: Text(e.email!),
                      trailing: Icon(Icons.delete),
                    );
                  }).toList(),
                ),
              ),
              Obx(
                () => groupController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          groupController.createGroup();
                        },
                        child: const Text("Create Group"),
                      ),
              ),
              const Text("All groups"),
              Obx(
                () => Column(
                  children: groupController.groupList.map((e) {
                    return ListTile(
                      onTap: () {
                        print(e.name);
                        print(e.members);
                      },
                      leading: CircleAvatar(
                        child: Text("A"),
                      ),
                      title: Text("${e.name}"),
                      trailing: Icon(Icons.delete),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  groupController.getYourGroup();
                },
                child: Text("get your group"),
              ),
               Obx(
                () => Column(
                  children: groupController.yourGroupList.map((e) {
                    return ListTile(
                      onTap: () {
                        print(e.name);
                        print(e.members);
                      },
                      leading: CircleAvatar(
                        child: Text("A"),
                      ),
                      title: Text("${e.name}"),
                      trailing: Icon(Icons.delete),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
