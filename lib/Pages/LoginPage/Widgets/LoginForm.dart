import 'package:expense_manager/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: authController.loginEmail,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
              )),
        ),
        const SizedBox(height: 30),
        TextFormField(
          controller: authController.loginPassword,
          onFieldSubmitted: (s) {
            print("Click on Done button $s ");
            authController.loginWithEmailAndPassword();
          },
          decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(
                Icons.lock_sharp,
              )),
        ),
        const SizedBox(height: 20),
        const Text(
          "Forgot your password?",
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 15),
        ),
        const SizedBox(height: 20),
        InkWell(
            onTap: () {
              authController.loginWithEmailAndPassword();
            },
            child: Obx(
              () => Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary),
                child: authController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('Assets/Icons/lock.svg',
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
              ),
            ))
      ],
    );
  }
}
