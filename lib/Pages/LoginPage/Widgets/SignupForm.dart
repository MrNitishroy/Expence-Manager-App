import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
              )),
        ),
        const SizedBox(height: 30),
        const TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(
                Icons.lock_sharp,
              )),
        ),
        const SizedBox(height: 30),
        TextFormField(
          onFieldSubmitted: (s) {
            print("Click on Done button $s ");
            Get.offAllNamed("/home");
          },
          decoration: const InputDecoration(
              hintText: "Confirm Password",
              prefixIcon: Icon(
                Icons.lock_sharp,
              )),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {
            Get.offAllNamed("/home");
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
