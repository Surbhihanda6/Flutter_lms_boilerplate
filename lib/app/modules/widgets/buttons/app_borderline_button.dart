import 'package:flutter/material.dart';

class AppBorderlineButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? width;
  final VoidCallback onPressed;

  const AppBorderlineButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color ?? Colors.purple,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: color ?? Colors.purple,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
