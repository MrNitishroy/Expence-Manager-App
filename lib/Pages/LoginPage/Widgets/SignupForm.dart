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
        Obx(
          () => TextField(
            controller: authController.nameController,
            textInputAction: TextInputAction.next,
            
            decoration: InputDecoration(
              errorText: authController.nameError.value,
              
              helperStyle: const TextStyle(color: Colors.red),
              hintText: "Full Name",
              prefixIcon: Icon(
                Icons.person_outline_sharp,
              ),
            ),
          ),
        ),
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
        // const SizedBox(height: 10),
        TextFormField(
          controller: authController.password,
          onFieldSubmitted: (s) {},
          decoration: const InputDecoration(
              hintText: "Confirm Password",
              prefixIcon: Icon(
                Icons.lock_sharp,
              )),
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                  value: authController.remenberMe.value,
                  onChanged: (value) {
                    authController.remenberMe.value = value!;
                  }),
            ),
            Text("Remember me")
          ],
        ),
        const SizedBox(height: 30),
        Obx(() => authController.isLoading.value
            ? Container(
                height: 50,
                width: 50,
                child: const CircularProgressIndicator(),
              )
            : InkWell(
                onTap: () {
                  authController.signupWithEmailAndPassword(context);
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
                        "SIGN UP",
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
