import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios_new),
                SizedBox(width: 10),
                Text(
                  "Setting",
                  style: TextStyle(fontSize: 32),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
