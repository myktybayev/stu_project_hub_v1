import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  const CustomInputField({
    required this.hintText,
    this.controller,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
