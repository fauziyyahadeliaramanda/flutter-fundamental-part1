import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Nama saya Fauziyyah Adelia Ramanda, sedang ikut TSA Mobile Flutter',
      style: TextStyle(
        fontSize: 18,
        color: Colors.red,
      ),
      textAlign: TextAlign.center,
    );
  }
}
