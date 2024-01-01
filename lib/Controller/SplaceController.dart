import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    splaceScreenHandle();
  }
  void splaceScreenHandle() async {
    await Future.delayed(Duration(seconds: 3));
    if (auth.currentUser != null) {
      Get.offNamed("/home");
    } else {
      Get.offNamed("/welcomePage");
    }
  }
}
