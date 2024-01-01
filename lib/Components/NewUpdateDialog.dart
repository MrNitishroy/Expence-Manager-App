import 'package:expense_manager/Controller/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> NewUpdateDialog(BuildContext context) {
  AppController appController = Get.put(AppController());
  return Get.defaultDialog(
      title: "New Update Available",
      content: Column(
        children: [
          Text(
            "New Update Available, You are using old version of app. Please update your app to latest version. please update your app to latest version. ",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
          label: Text("Close"),
        ),
        ElevatedButton.icon(
          onPressed: () {
            launchUrl(
              Uri.parse(appController.apkUrl.value),
              mode: LaunchMode.externalApplication,
            );
            Get.back();
          },
          icon: Icon(Icons.update_rounded),
          label: Text("UPDATE"),
        ),
      ]);
}
