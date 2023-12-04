import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/Models/TransactionModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxString accountSelected = "personal".obs;
  RxList<TransactionModel> transactionList = RxList<TransactionModel>();

  void getTransactionList() async {
    transactionList.clear();
    db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        transactionList.add(TransactionModel.fromJson(element.data()));
      });
    });
  }

  void addTransaction(TransactionModel transactionModel) async {
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("accounts")
        .doc(accountSelected.value)
        .collection("transactions")
        .add(
          transactionModel.toJson(),
        );
  }
}
