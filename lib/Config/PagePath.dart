import 'package:expense_manager/Pages/HomePage/HomePage.dart';
import 'package:expense_manager/Pages/LoginPage/LoginPage.dart';
import 'package:expense_manager/Pages/ProfilePage/ProfilePage.dart';
import 'package:get/get.dart';

var pages = [
  GetPage(
    name: '/home',
    page: () => HomePage(),
  ),
  GetPage(
    name: '/authPage',
    page: () => LoginPage(),
    transition: Transition.fade
  ),
  
  GetPage(
    name: '/profilePage',
    page: () => ProfilePage(),
    transition: Transition.rightToLeftWithFade
  ),



];
