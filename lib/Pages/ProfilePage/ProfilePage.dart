import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          child: Column(
                children: [
          ExpansionTile(
            title: Text("Welcome"),
            trailing: Icon(Icons.arrow_drop_down),
            children: [
              ListTile(
                title: Text("Profile"),
              ),
            ],
          )
                ],
              ),
        ));
  }
}
