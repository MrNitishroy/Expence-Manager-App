import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Config/Colors.dart';
import 'package:expense_manager/Models/AccountModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  void signupWithEmailAndPassword() async {
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
          initDatabase();
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
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          errorMessage("😍 No user found for that email.");
        } else if (e.code == 'wrong-password') {
          errorMessage("😍 Wrong password provided for that user.");
        }
      }
      isLoading.value = false;
    }
  }

  void loginWithGamil() async {
    isLoading.value = true;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.snackbar("Success", "Account Created Successfully");
    Get.offNamed("/home");
    isLoading.value = false;
  }

  void logOut() async {
    await auth.signOut();
    Get.offNamed("/authPage");
    successMessage("😭Logout");
  }

// Data base work

  void initDatabase() async {
    var uId = Uuid().v4();
    var initAccount = AccountModel(
      id: uId,
      name: "Personal",
      date: "",
      expense: 00,
      income: 00,
      total: 00,
      time: "",
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc("personal")
        .set(initAccount.toJson());
    successMessage("🪲 DB INIT");
  }
}
