import 'package:expense_manager/Components/NewUpdateDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  late PackageInfo packageInfo;
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> checkUpdate(BuildContext context) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 6), () {
      isLoading.value = false;
      NewUpdateDialog(context);
    });
    isLoading.value = false;
  }
}
