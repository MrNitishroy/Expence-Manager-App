import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> NewUpdateDialog(BuildContext context) {
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
          onPressed: () {},
          icon: Icon(Icons.close),
          label: Text("Close"),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.update_rounded),
          label: Text("UPDATE"),
        ),
      ]);
}
