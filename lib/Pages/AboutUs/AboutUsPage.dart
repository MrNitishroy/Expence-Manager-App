import 'package:expense_manager/Components/NewUpdateDialog.dart';
import 'package:expense_manager/Controller/AppController.dart';
import 'package:expense_manager/Pages/BugPage/BugPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsPage extends StatelessWidget {
  final String version;
  const AboutUsPage({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        actions: [
          IconButton(
            onPressed: () {
              NewUpdateDialog(context);
            },
            icon: Icon(Icons.update_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "Assets/Icons/logo.svg",
                  width: 200,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UNI WALLETS",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Version $version",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Developed By - Nitish Kumar",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "This app is now in beta version. If you find any bug in this app, please report it to us. We will fix it as soon as possible.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() => appController.isLoading.value
                ? LinearProgressIndicator()
                : const Row(
                    children: [
                      Text(
                        "Your are using latest version",
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    ],
                  )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(BugPage());
                  },
                  icon: Icon(Icons.bug_report_rounded),
                  label: Text("Bug Report"),
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    appController.checkUpdate(context);
                  },
                  icon: Icon(Icons.update_sharp),
                  label: Text("Check Update"),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
