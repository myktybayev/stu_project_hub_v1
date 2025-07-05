import 'package:flutter/material.dart';
import 'package:stu_project_hub/widgets/custom_tag.dart';
import 'package:stu_project_hub/config/app_text_styles.dart';
import 'package:stu_project_hub/widgets/custom_primary_button.dart';

class CustomChallengeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String status;
  final Color statusColor;
  final String description;
  final String dateLabel;
  final String buttonText;
  final Color buttonColor;
  const CustomChallengeCard({
    required this.imageUrl,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.description,
    required this.dateLabel,
    required this.buttonText,
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
                      text: status,
                      color: statusColor,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: AppTextStyles.body.copyWith(color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dateLabel, style: AppTextStyles.muted),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CustomPrimaryButton(
                        text: buttonText,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
