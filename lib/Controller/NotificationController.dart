import 'dart:async';

import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:reflex/reflex.dart';

class NotificationController extends GetxController {
  Reflex reflex = Reflex();
  RxBool isNotificationPermissionGranted = false.obs;
  StreamSubscription<ReflexEvent>? _subscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    isNotificationPermissionGranted.value = await Reflex.isPermissionGranted;
    requestPermission();
  }

  Future checkPermission() async {
    if (isNotificationPermissionGranted.value) {
      // Do something if permission is granted
    } else {
      // Do something if permission is not granted
    }
  }

  void requestPermission() async {
    if (await Reflex.isPermissionGranted) {
      isNotificationPermissionGranted.value = true;
      successMessage('Permission Granted');
      await startListeningNotification();
    } else {
      print('Permission Denied');
      await Reflex.requestPermission();
    }
  }

  bool notificationListening = false;
  Future startListeningNotification() async {
    successMessage('Start Listening Notification');
    _subscription?.cancel();
    _subscription = reflex.notificationStream!.listen(
      (event) {
      
        print(event);
      },
    );
  }
}
