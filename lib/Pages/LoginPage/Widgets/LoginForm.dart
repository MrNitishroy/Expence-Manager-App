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
        Obx(
          () => TextFormField(
            obscureText: authController.ispwdHide.value,
            controller: authController.loginPassword,
            onFieldSubmitted: (s) {
              print("Click on Done button $s ");
              authController.loginWithEmailAndPassword();
            },
            decoration: InputDecoration(
                hintText: "Password",
                suffix: authController.ispwdHide.value
                    ? InkWell(
                        onTap: () {
                          authController.ispwdHide.value =
                              !authController.ispwdHide.value;
                        },
                        child: const Icon(Icons.visibility_off))
                    : InkWell(
                        onTap: () {
                          authController.ispwdHide.value =
                              !authController.ispwdHide.value;
                        },
                        child: const Icon(Icons.visibility)),
                prefixIcon: Icon(
                  Icons.lock_sharp,
                )),
          ),
        ),
        const SizedBox(height: 10),
        // const Text(
        //   "Forgot your password?",
        //   style: TextStyle(
        //       color: Colors.blue,
        //       decoration: TextDecoration.underline,
        //       decorationColor: Colors.blue,
        //       fontSize: 15),
        // ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                  value: authController.remenberMe.value,
                  onChanged: (value) {
                    authController.remenberMe.value = value!;
                  }),
            ),
            Text("Remember me", style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
        const SizedBox(height: 20),
        Obx(() => authController.isLoading.value
            ? Container(
                height: 50,
                width: 50,
                child: const CircularProgressIndicator(),
              )
            : InkWell(
                onTap: () { authController.loginWithEmailAndPassword();
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('Assets/Icons/lock.svg',
                          color: Theme.of(context).colorScheme.onBackground),
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
              )),
       
      ],
    );
  }
}
