import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AppController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> checkLatestVersion() async {
    isLoading.value = true;
    const repositoryOwner = 'MrNitishroy';
    const repositoryName = 'Uni-Wallet';
    try {
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

          print('  - $assetName: $assetDownloadUrl');
        }
      } else {
        print(
            'Failed to fetch GitHub release info. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkUpdate(BuildContext context) async {
    isLoading.value = true;

    await checkLatestVersion();
    await Future.delayed(Duration(seconds: 6));

    isLoading.value = false;
    // NewUpdateDialog(context);
  }
}
