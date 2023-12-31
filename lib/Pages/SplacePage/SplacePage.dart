import 'package:expense_manager/Controller/AccountController.dart';
import 'package:expense_manager/Controller/DbController.dart';
import 'package:expense_manager/Controller/SplaceController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    AccountCntroller accountCntroller = Get.put(AccountCntroller());
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          "Assets/Icons/logo.svg",
          width: 100,
        ),
      ),
    );
  }
}
