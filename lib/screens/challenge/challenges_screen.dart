import 'package:flutter/material.dart';
import 'package:stu_project_hub/config/colors.dart';
import 'package:stu_project_hub/widgets/custom_challenge_card.dart';
import 'package:stu_project_hub/widgets/custom_typography.dart';
import 'package:stu_project_hub/screens/challenge/challenge_detail_screen.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final challenges = [
      ChallengeModel(
        imageUrl:
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
        title: 'Sustainable Campus Initiative',
        status: 'Active',
        statusColor: Colors.green,

        description:
            'Create AI-powered tools to assist students with disabilities.',
        goal: 'Goal for this challenge.',
        customerInfo: 'Customer info for this challenge.',
        prize: 'Prize details.',
        deadline: 'Due: Nov 15, 2024',
        submissionMethod: 'Submission method details.',
      ),
      ChallengeModel(
        imageUrl:
            'https://images.unsplash.com/photo-1464983953574-0892a716854b',
        title: 'AI for Accessibility',
        status: 'Active',
        statusColor: Colors.green,
        description:
            'Create AI-powered tools to assist students with disabilities.',
        goal: 'Goal for this challenge.',
        customerInfo: 'Customer info for this challenge.',
        prize: 'Prize details.',
        deadline: 'Due: Nov 15, 2024',
        submissionMethod: 'Submission method details.',
      ),
      ChallengeModel(
        imageUrl:
            'https://images.unsplash.com/photo-1517841905240-472988babdf9',
        title: 'Community Engagement Platform',
        status: 'Upcoming',
        statusColor: Colors.orange,
        description:
            'Build a platform to connect students with local volunteer opportunities.',
        goal: 'Goal for this challenge.',
        customerInfo: 'Customer info for this challenge.',
        prize: 'Prize details.',
        deadline: 'Starts: Dec 1, 2024',
        submissionMethod: 'Submission method details.',
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionTitle('Challenges'),
            const SizedBox(height: 16),
            ...challenges.map(
              (challenge) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => ChallengeDetailScreen(challenge: challenge),
                      ),
                    );
                  },
                  child: CustomChallengeCard(
                    imageUrl: challenge.imageUrl,
                    title: challenge.title,
                    status: challenge.status,
                    statusColor: challenge.statusColor,
                    description: challenge.description,
                    dateLabel: challenge.deadline,
                    buttonText: 'Participate',
                    buttonColor: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
