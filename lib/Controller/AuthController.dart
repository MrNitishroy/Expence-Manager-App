import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isLogin = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  RxString pwdError = "".obs;
  RxBool isLoading = false.obs;
  final auth = FirebaseAuth.instance;

  void signupWithEmailAndPass() async {
    isLoading.value = true;
    try {
      if (email.text.isEmpty ||
          password.text.isEmpty ||
          cPassword.text.isEmpty) {
        Get.snackbar("Error", "Please fill all the fields");
        isLoading.value = false;
        return;
      } else {
        if (password.text != cPassword.text) {
          // Get.snackbar("Error", "Password Not Matched");
          pwdError.value = "Password Not Matched";
          isLoading.value = false;
          return;
        }
        await auth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Get.snackbar("Success", "Account Created Successfully");
        Get.offNamed("/homePage");
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
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
  } 
}
