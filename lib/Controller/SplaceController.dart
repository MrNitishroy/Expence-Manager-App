import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceScreenHandle();
  }
  final auth = FirebaseAuth.instance;
  void splaceScreenHandle() async {
    await Future.delayed(Duration(seconds: 2));
    if (auth.currentUser != null) {
      Get.offNamed("/home");
    } else {
      Get.offNamed("/authPage");
    }
  }
}
