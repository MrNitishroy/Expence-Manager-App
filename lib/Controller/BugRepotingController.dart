import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:get/get.dart';

import '../Models/BugModel.dart';

class BugReportController extends GetxController {
  RxBool isLoading = false.obs;
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  final db = FirebaseFirestore.instance;
  RxList<BugModel> bugList = <BugModel>[].obs;

  Future<void> sendBugReport(String title, String des) async {
    isLoading.value = true;
    var newBug = BugModel(
      title: title,
      des: des,
      userName: accountCntroller.currentUserData.value.name,
      userEmail: accountCntroller.currentUserData.value.email,
      createdDate: DateTime.now().toString(),
    );
    if (title == "" && des == "") {
      errorMessage("Please Fill All Fields");
      isLoading.value = false;
    } else {
      try {
        await db.collection("BugReport").add(
              newBug.toJson(),
            );
        successMessage("Bug Report Send");
        getBugReport();
        isLoading.value = false;
      } catch (e) {
        errorMessage(e.toString());
        isLoading.value = false;
      }
    }
  }

  Future<void> getBugReport() async {
    isLoading.value = true;
    bugList.clear();
    try {
      await db.collection("BugReport").get().then((value) {
        value.docs.forEach((element) {
          bugList.add(BugModel.fromJson(element.data()));
        });
      });
      isLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      isLoading.value = false;
    }
  }
}
