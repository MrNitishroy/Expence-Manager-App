import 'package:expense_manager/Controller/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: authController.email,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
              )),
        ),
        const SizedBox(height: 30),
        Obx(
          () => TextField(
            controller: authController.password,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                helperText: authController.pwdError.value,
                helperStyle: const TextStyle(color: Colors.red),
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock_sharp,
                )),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: authController.cPassword,
          onFieldSubmitted: (s) {
          },
          decoration: const InputDecoration(
              hintText: "Confirm Password",
              prefixIcon: Icon(
                Icons.lock_sharp,
              )),
        ),
          Row(children: [
          Obx(() => Checkbox(value: authController.remenberMe.value, onChanged: (value) {
            authController.remenberMe.value = value!;
          }),),
          Text("Remember me")

        ],),
        const SizedBox(height: 30),
        Obx(() => InkWell(
          onTap: () {
            authController.signupWithEmailAndPassword();
          },
          child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: authController.isLoading.value ? const Center(child: CircularProgressIndicator(),) : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('Assets/Icons/lock.svg',
                          color: Theme.of(context).colorScheme.onBackground),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "SIGN UP",
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
