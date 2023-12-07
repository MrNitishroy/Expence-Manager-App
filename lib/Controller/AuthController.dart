import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Models/AccountModel.dart';
import 'package:expense_manager/Models/DropdownModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  RxBool isLogin = true.obs;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  RxString pwdError = "".obs;
  RxBool isLoading = false.obs;
  RxBool ispwdHide = true.obs;
  RxBool remenberMe = true.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fillData();
  }

  void fillData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loginEmail.text = prefs.getString("email") ?? "";
    loginPassword.text = prefs.getString("password") ?? "";
  }

  void signupWithEmailAndPassword(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    pwdError.value = "";
    if (email.text.isEmpty || password.text.isEmpty || cPassword.text.isEmpty) {
      errorMessage("😎 All fields are required");
      return;
    } else {
      if (password.text == cPassword.text) {
        isLoading.value = true;
        try {
          await auth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);

          successMessage("🎉 Account Created Successfully");
          initDatabase(context);
          Get.offNamed("/home");
          prefs.setString("email", email.text);
          prefs.setString("password", password.text);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            errorMessage("🔒 weak password");
          } else if (e.code == 'email-already-in-use') {
            errorMessage("😍 User Exist");
          }
        } catch (e) {
          print(e);
        }
        isLoading.value = false;
      } else {
        pwdError.value = "Password and Confirm Password not match";
        errorMessage("🔒 Password not match");
      }
    }
  }

  void loginWithEmailAndPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (loginEmail.text.isEmpty || loginPassword.text.isEmpty) {
      errorMessage("😎 All fields are required");
      return;
    } else {
      isLoading.value = true;
      try {
        await auth.signInWithEmailAndPassword(
            email: loginEmail.text, password: loginPassword.text);
        successMessage("🎉 Login Successfully");
        Get.offNamed("/home");
        prefs.setString("email", loginEmail.text);
        prefs.setString("password", loginPassword.text);
      } catch (e) {
        errorMessage("😭 Invalid Email or Password");
      }
      isLoading.value = false;
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offNamed("/authPage");
    successMessage("😭Logout");
  }

// Data base work

  void initDatabase(BuildContext context) async {
    String time = TimeOfDay.now().format(context);
    String date = DateFormat("dd MMM yyyy").format(
      DateTime.now(),
    );
    var uId = Uuid().v4();
    var initAccount = AccountModel(
      id: uId,
      name: "Personal",
      date: date,
      expense: 00,
      income: 00,
      total: 00,
      time: time,
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc("personal")
        .set(initAccount.toJson());

    successMessage("🪲 DB INIT");
    initCategory();
    initPaymentMode();
  }

  void initCategory() async {
    var newCategory = [
      DropDownModel(
        name: "Food",
        value: "food",
        icon: "Assets/Icons/FoodIcon/food.svg",
      ),
      DropDownModel(
        name: "Shopping",
        value: "shopping",
        icon: "Assets/Icons/FoodIcon/shopping.svg",
      ),
      DropDownModel(
        name: "Travel",
        value: "travel",
        icon: "Assets/Icons/FoodIcon/travel.svg",
      ),
      DropDownModel(
        name: "Bread",
        value: "bread",
        icon: "Assets/Icons/FoodIcon/bread.svg",
      ),
      DropDownModel(
        name: "Chiken",
        value: "chiken",
        icon: "Assets/Icons/FoodIcon/chiken.svg",
      ),
      DropDownModel(
        name: "Rent",
        value: "rent",
        icon: "Assets/Icons/FoodIcon/home.svg",
      ),
      DropDownModel(
        name: "Reacharge",
        value: "reacharge",
        icon: "Assets/Icons/FoodIcon/mobile.svg",
      ),
      DropDownModel(
        name: "Bills",
        value: "bills",
        icon: "Assets/Icons/FoodIcon/other.svg",
      ),
      DropDownModel(
        name: "Others",
        value: "others",
        icon: "Assets/Icons/FoodIcon/other.svg",
      ),
    ];
    for (var element in newCategory) {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("category")
          .add(
            element.toJson(),
          );
    }
    successMessage("😍Category Init");
  }

  void initPaymentMode() async {
    var newMode = DropDownModel(
      value: "cash",
      name: "Cash",
      icon: "Assets/Icons/logo.svg",
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .add(
          newMode.toJson(),
        );
    successMessage("Init Payment Mode");
  }
}
