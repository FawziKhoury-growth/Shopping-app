import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: 8.0),
          Text(title),
          ],
       ),
    );
  }
}