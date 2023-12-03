import 'package:expense_manager/Config/PagePath.dart';
import 'package:expense_manager/Config/Theme.dart';
import 'package:expense_manager/Pages/HomePage/HomePage.dart';
import 'package:expense_manager/Pages/LoginPage/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages,
      title: 'Expense Tracker',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: LoginPage()
    );
  }
}
