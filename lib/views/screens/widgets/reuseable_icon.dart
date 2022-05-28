import 'package:connectify/utilities/colors.dart';
import 'package:flutter/material.dart';

class ReuseableIcon extends StatelessWidget {
  @override
  final IconData icon;
  final String text;
  final onPressed;

  ReuseableIcon(
      {required this.icon, required this.text, required this.onPressed});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                  style: BorderStyle.solid,
                )),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Center(child: Text(text, style: TextStyle(color: Colors.grey[300]))),
        ],
      ),
    );
  }
}
