import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  late PackageInfo packageInfo;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
     packageInfo = await PackageInfo.fromPlatform();
  }
}
