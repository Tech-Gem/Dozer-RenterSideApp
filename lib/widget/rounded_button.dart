import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color buttonColor;

  const RoundedButton({
    required this.child,
    required this.onPressed,
    this.height = 50.0, // Default height
    this.width = 120.0, // Default width
    this.buttonColor = modalBackgroundColor, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(child: child),
      ),
    );
  }
}