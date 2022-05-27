import 'package:flutter/material.dart';

import '../../../utilities/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final onPressed;

  CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
