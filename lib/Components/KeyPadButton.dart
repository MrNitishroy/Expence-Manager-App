import 'package:expense_manager/Controller/BottomSheetController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class KeyPaddButton extends StatelessWidget {
  final String keyName;
  const KeyPaddButton({super.key, required this.keyName});

  @override
  Widget build(BuildContext context) {
    BottomSheetController bottomSheetController =
        Get.put(BottomSheetController());
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        if (keyName == ".") {
          if (bottomSheetController.amountValue.value.contains(".")) {
            return;
          }
        }
          if (bottomSheetController.amountValue.value.length < 7) {
            bottomSheetController.amountValue.value =
                bottomSheetController.amountValue.value + keyName;
          } else {}
      },
      child: Container(
        margin: EdgeInsets.all(2),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff191B28).withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            keyName,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
