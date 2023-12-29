import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Models/AccountModel.dart';
import 'package:expense_manager/Models/DropdownModel.dart';
import 'package:expense_manager/Models/MeesagesModel.dart';
import 'package:expense_manager/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  RxBool isLogin = true.obs;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailUpdate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  AccountCntroller accountCntroller = Get.put(AccountCntroller());
  RxString pwdError = "".obs;
  RxString nameError = "".obs;
  RxBool isLoading = false.obs;
  RxBool ispwdHide = true.obs;
  RxBool remenberMe = true.obs;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxString paswordSaved = "".obs;

  @override
  void onInit() async {
    super.onInit();
    fillData();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    paswordSaved.value = prefs.getString("password")!;
  }

  void fillData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loginEmail.text = prefs.getString("email") ?? "";
    loginPassword.text = prefs.getString("password") ?? "";
  }

  Future<void> signupWithEmailAndPassword(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    pwdError.value = "";
    if (email.text.isEmpty || password.text.isEmpty) {
      errorMessage("😎 All fields are required");
      return;
    } else {
      if (nameController.text != "") {
        try {
          await auth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);
          successMessage("🎉 Account Created Successfully");
          await initDatabase(context);
          await initCategory();
          await initPaymentMode();
          await initUserData();
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
        nameError.value = "Name is required";
        isLoading.value = false;
        // errorMessage("🔒 Password not match");
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

  Future<void> initDatabase(BuildContext context) async {
    String time = TimeOfDay.now().format(context);
    String date = DateFormat("dd MMM yyyy").format(
      DateTime.now(),
    );
    String tempId = Uuid().v1();
    String accountId = "ac" + tempId;
    var uId = Uuid().v4();
    var initAccount = AccountModel(
      id: "personal",
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
  }

  Future<void> initCategory() async {
    String tempId = Uuid().v1();
    var newCategory = [
      DropDownModel(
        id: "cat$tempId",
        name: "Food",
        value: "food",
        icon: "Assets/Icons/FoodIcon/food.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Shopping",
        value: "shopping",
        icon: "Assets/Icons/FoodIcon/shopping.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Travel",
        value: "travel",
        icon: "Assets/Icons/FoodIcon/travel.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Bread",
        value: "bread",
        icon: "Assets/Icons/FoodIcon/bread.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Chiken",
        value: "chiken",
        icon: "Assets/Icons/FoodIcon/chiken.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Rent",
        value: "rent",
        icon: "Assets/Icons/FoodIcon/home.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Reacharge",
        value: "reacharge",
        icon: "Assets/Icons/FoodIcon/mobile.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Bills",
        value: "bills",
        icon: "Assets/Icons/FoodIcon/other.svg",
      ),
      DropDownModel(
        id: "cat$tempId",
        name: "Others",
        value: "others",
        icon: "Assets/Icons/FoodIcon/other.svg",
      ),
    ];
    for (var cat in newCategory) {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("category")
          .add(
            cat.toJson(),
          );
    }
    successMessage("😍Category Init");
  }

  Future<void> initPaymentMode() async {
    String tempId = Uuid().v1();
    String id = "tran" + tempId;
    var newMode = DropDownModel(
      id: id,
      value: "cash",
      name: "Cash",
      icon: "Assets/Icons/logo.svg",
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("paymentMode")
        .doc(id)
        .set(
          newMode.toJson(),
        );
    successMessage("Init Payment Mode");
  }

  Future<void> initUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var newUser = UserModel(
        id: auth.currentUser!.uid,
        name: nameController.text,
        email: auth.currentUser!.email,
        profile: auth.currentUser!.photoURL,
        password: prefs.getString("password") ?? "");

    await db.collection("users").doc(auth.currentUser!.uid).set(
          newUser.toJson(),
        );
    successMessage("😍 User Init");
  }

  Future updateUserName() async {
    await db.collection("users").doc(auth.currentUser!.uid).update({
      "name": nameController.text,
    });
    accountCntroller.getUserDetails();
    successMessage("Name Updated");
  }

  Future updateUserEmail() async {
    await db.collection("users").doc(auth.currentUser!.uid).update({
      "email": emailUpdate.text,
    });
    accountCntroller.getUserDetails();
    successMessage('Email updated');
  }

  Future updateUserNumber() async {
    await db.collection("users").doc(auth.currentUser!.uid).update({
      "name": "Nitish Kumar",
    });
  }
}
