import 'package:flutter/material.dart';

class CustomGitHubButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomGitHubButton({required this.text, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      icon: const Icon(
        Icons.code,
      ), // TODO: GitHub icon пакеті болса, соны қолдану
      label: Text(text),
    );
  }
}
