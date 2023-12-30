import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/BugRepotingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BugPage extends StatelessWidget {
  const BugPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();
    BugReportController bugReportController = BugReportController();
    AccountCntroller accountCntroller = Get.put(AccountCntroller());

    return Scaffold(
      appBar: AppBar(
        title: Text("Bug Report"),
        actions: [
          accountCntroller.currentUserData.value.email!.toLowerCase() == "nitishr833@gmail.com"
              ? IconButton(
                  onPressed: () {
                    bugReportController.getBugReport();
                  },
                  icon: Icon(Icons.refresh),
                )
              : SizedBox()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Bug Report",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "If you find any bug in this app, please report it to us. We will fix it as soon as possible.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                hintText: "title",
                                prefixIcon: Icon(Icons.title),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: desController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: "Description",
                              ),
                            ),
                            SizedBox(height: 20),
                            Obx(
                              () => bugReportController.isLoading.value
                                  ? CircularProgressIndicator()
                                  : ElevatedButton.icon(
                                      onPressed: () {
                                        bugReportController.sendBugReport(
                                          titleController.text,
                                          desController.text,
                                        );
                                      },
                                      icon: Icon(Icons.bug_report_rounded),
                                      label: Text("Bug Report"),
                                    ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              Obx(() => accountCntroller.currentUserData.value.email!.toLowerCase() ==
                      "nitishr833@gmail.com"
                  ? Column(
                      children: bugReportController.bugList
                          .map(
                            (e) => ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Icon(Icons.bug_report_rounded),
                              ),
                              title: Text(e.title!),
                              subtitle: Text(
                                e.des!,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              onTap: () {},
                            ),
                          )
                          .toList(),
                    )
                  : SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
