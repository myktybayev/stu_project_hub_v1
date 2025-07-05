import 'package:flutter/material.dart';
import '../config/colors.dart';

class CustomSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomSecondaryButton({required this.text, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.black,
        minimumSize: const Size.fromHeight(40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
