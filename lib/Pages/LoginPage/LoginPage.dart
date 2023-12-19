import 'package:expense_manager/Controller/AuthController.dart';
import 'package:expense_manager/Controller/LoginController.dart';
import 'package:expense_manager/Pages/LoginPage/Widgets/LoginForm.dart';
import 'package:expense_manager/Pages/LoginPage/Widgets/SignupForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset("Assets/Icons/logo.svg"),
                  ),
                  SizedBox(width: 10),
                   Text(
                    "UNIWALT",
                  style:Theme.of(context).textTheme.headlineMedium
                  )
                ],
              ),
              const SizedBox(height: 70),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WELCOME 😍 ",
                              style:Theme.of(context).textTheme.headlineSmall
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    authController.isLogin.value = true;
                                  },
                                  child: Obx(
                                    () => Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text("Login",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: authController
                                                            .isLogin.value
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onBackground)),
                                            const SizedBox(height: 10),
                                            AnimatedContainer(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              height: 4,
                                              width:
                                                  authController.isLogin.value
                                                      ? 100
                                                      : 0,
                                            )
                                          ],
                                        )),
                                  )),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  authController.isLogin.value = false;
                                },
                                child: Obx(
                                  () => Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign up",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  authController.isLogin.value
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .onBackground
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .primary),
                                        ),
                                        SizedBox(height: 10),
                                        AnimatedContainer(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          duration: Duration(milliseconds: 200),
                                          height: 4,
                                          width: authController.isLogin.value
                                              ? 0
                                              : 100,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Obx(() => authController.isLogin.value
                            ? LoginForm()
                            : SignupForm())
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(height: 50),
            
            ]),
          ),
        ),
      ),
    );
  }
}
