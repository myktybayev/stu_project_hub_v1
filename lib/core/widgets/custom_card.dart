import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/widgets/custom_tag.dart';
import 'package:stu_project_hub/core/theme/app_text_styles.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String description;
  final int likes;
  final int? commentsCount;
  final VoidCallback? onTap;
  const CustomCard({
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.description,
    required this.likes,
    this.commentsCount,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(title, style: AppTextStyles.cardTitle),
                      ),
                      CustomTag(
                        text: category,
                        color: Colors.blue.shade100,
                        textColor: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(description, style: AppTextStyles.body),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        likes.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      if (commentsCount != null) ...[
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.mode_comment_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          commentsCount.toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const CustomBadge({
    required this.text,
    required this.color,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
