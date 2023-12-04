import 'package:get/get.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceScreenHandle();
  }

  void splaceScreenHandle() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed("/authPage");
  }
}
