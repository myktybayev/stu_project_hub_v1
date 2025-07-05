import 'package:flutter/material.dart';
import 'package:stu_project_hub/config/colors.dart';

class ChallengeModel {
  final String imageUrl;
  final String title;
  final String status;
  final Color statusColor;
  final String description;
  final String goal;
  final String customerInfo;
  final String prize;
  final String deadline;
  final String submissionMethod;

  ChallengeModel({
    required this.imageUrl,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.description,
    required this.goal,
    required this.customerInfo,
    required this.prize,
    required this.deadline,
    required this.submissionMethod,
  });
}

class ChallengeDetailScreen extends StatelessWidget {
  final ChallengeModel challenge;
  const ChallengeDetailScreen({Key? key, required this.challenge})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Challenge Details',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                challenge.imageUrl,
                width: double.infinity,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          challenge.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.verified,
                              color: challenge.statusColor,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              challenge.status,
                              style: TextStyle(
                                color: challenge.statusColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text('Participate'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            _sectionCard(
              icon: Icons.info_outline,
              title: 'Description',
              content: challenge.description,
            ),
            _sectionCard(
              icon: Icons.flag_outlined,
              title: 'Goal',
              content: challenge.goal,
            ),
            _sectionCard(
              icon: Icons.business_center_outlined,
              title: 'Customer Info',
              content: challenge.customerInfo,
            ),
            _sectionCard(
              icon: Icons.emoji_events_outlined,
              title: 'Prize',
              content: challenge.prize,
            ),
            _sectionCard(
              icon: Icons.schedule_outlined,
              title: 'Deadline',
              content: challenge.deadline,
            ),
            _sectionCard(
              icon: Icons.upload_file_outlined,
              title: 'Submission',
              content: challenge.submissionMethod,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(icon, color: AppColors.primary, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
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
