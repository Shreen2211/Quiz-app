import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  final String text;
  const CustomHeaderText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
