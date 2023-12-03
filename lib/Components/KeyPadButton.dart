import 'package:flutter/material.dart';

class KeyPaddButton extends StatelessWidget {
  final String keyName;
  final VoidCallback onTap;
  const KeyPaddButton({super.key, required this.keyName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff191B28).withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            keyName,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
