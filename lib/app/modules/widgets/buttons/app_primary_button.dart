import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? width;
  final VoidCallback onPressed;

  const AppPrimaryButton({
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
        width: width, // Set the width according to your needs
        height: 50, // Set the height according to your needs
        decoration: BoxDecoration(
          color: color, // Use the passed color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Shadow spread
              blurRadius: 5, // Shadow blur
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Center(
          child: Text(
            text!, // Use the passed text
            style: const TextStyle(
              color: Colors.white, // Text color
              fontSize: 16, // Text size
              fontWeight: FontWeight.bold, // Text weight
            ),
          ),
        ),
      ),
    );
  }
}
