import 'package:flutter/material.dart';

class ButtonModel extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  final VoidCallback onTap;

  const ButtonModel({
    Key? key,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: buttonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
