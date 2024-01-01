import 'package:expense_manager/Pages/BugPage/BugPage.dart';
import 'package:expense_manager/Pages/GroupPage/GroupPage.dart';
import 'package:expense_manager/Pages/HomePage/HomePage.dart';
import 'package:expense_manager/Pages/LoginPage/LoginPage.dart';
import 'package:expense_manager/Pages/ProfilePage/ProfilePage.dart';
import 'package:expense_manager/Pages/Welcome/Welcome.dart';
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
  
  GetPage(
    name: '/groupPage',
    page: () => GroupPage(),
    transition: Transition.rightToLeftWithFade
  ),
  GetPage(
    name: '/bugPage',
    page: () => BugPage(),
    transition: Transition.rightToLeftWithFade
  ),
  GetPage(
    name: '/welcomePage',
    page: () => WelcomePage(),
    transition: Transition.rightToLeftWithFade
  ),



];
