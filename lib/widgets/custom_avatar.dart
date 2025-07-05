import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  const CustomAvatar({this.imageUrl, this.size = 48, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? const Icon(Icons.person, size: 32) : null,
      backgroundColor: Colors.grey.shade200,
    );
  }
}
