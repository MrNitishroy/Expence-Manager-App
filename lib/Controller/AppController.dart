import 'dart:convert';
import 'dart:io';
import 'package:expense_manager/Components/NewUpdateDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  RxBool isLoading = false.obs;
  RxString currentVersion = "1.0.0".obs;
  RxString latestVersion = "1.0.0".obs;
  RxString apkUrl = "".obs;
  RxString apkName = "".obs;
  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion.value = packageInfo.version;
  }

  Future<void> checkLatestVersion(BuildContext context) async {
    const repositoryOwner = 'MrNitishroy';
    const repositoryName = 'Uni-Wallet';
    final response = await http.get(Uri.parse(
      'https://api.github.com/repos/$repositoryOwner/$repositoryName/releases/latest',
    ));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final tagName = data['tag_name'];
      final assets = data['assets'] as List<dynamic>;
      print('Latest release: $tagName');
      print('Assets:');

      for (final asset in assets) {
        final assetName = asset['name'];
        final assetDownloadUrl = asset['browser_download_url'];
        apkUrl.value = assetDownloadUrl;
        apkName.value = assetName;
        latestVersion.value = tagName;
        print(' - $assetName: $assetDownloadUrl');
        print(currentVersion.value);
        print(latestVersion.value);
        if (currentVersion.value != latestVersion.value) {
          NewUpdateDialog(context);
        }
      }
    } else {
      print(
          'Failed to fetch GitHub release info. Status code: ${response.statusCode}');
    }
  }



  Future<void> checkUpdate(BuildContext context) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 6));
    await checkLatestVersion(context);
    isLoading.value = false;
  }







}
