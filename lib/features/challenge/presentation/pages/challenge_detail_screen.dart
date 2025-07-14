import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/constants/colors.dart';
import 'package:stu_project_hub/domain/entities/challenge_model.dart';
import 'package:stu_project_hub/features/challenge/presentation/widgets/winner_card.dart';
import 'package:stu_project_hub/features/challenge/presentation/widgets/challenge_section_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallengeDetailScreen extends StatelessWidget {
  final ChallengeModel challenge;
  const ChallengeDetailScreen({Key? key, required this.challenge})
    : super(key: key);

  // Мысал winners дерегі (реал дерек келгенде challenge-дан алуға болады)
  List<WinnerTeam> get winners => [
    WinnerTeam(
      place: 1,
      teamName: 'Team Alpha',
      prize: '1 000 000 ₸',
      students: ['Шайзолла Нүртілеу', 'Қабкен Қайыркелді', 'Акбаров Дамир'],
    ),
    WinnerTeam(
      place: 2,
      teamName: 'Team Beta',
      prize: '700 000 ₸',
      students: ['Кадринов Даулет', 'Сапаров Руслан', 'Куандық Мадияр'],
    ),
    WinnerTeam(
      place: 3,
      teamName: 'Team Gamma',
      prize: '300 000 ₸',
      students: ['Бердибеков Заур', 'Калиматов Акжан', 'Муса Умар'],
    ),
  ];

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
                    child: Text(
                      challenge.status == 'Finished'
                          ? 'Winners'
                          : 'Participate',
                    ),
                  ),
                ],
              ),
            ),
            if (challenge.status == 'Finished') ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      winners
                          .map(
                            (winner) =>
                                Expanded(child: WinnerCard(winner: winner)),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 18),
            ],
            const SizedBox(height: 6),
            ChallengeSectionCard(
              icon: Icons.info_outline,
              title: 'Description',
              content: challenge.description,
            ),
            ChallengeSectionCard(
              icon: Icons.flag_outlined,
              title: 'Goal',
              content: challenge.goal,
            ),
            ChallengeSectionCard(
              icon: Icons.business_center_outlined,
              title: 'Customer Info',
              content: challenge.customerInfo,
            ),
            ChallengeSectionCard(
              icon: Icons.emoji_events_outlined,
              title: 'Prize',
              content: challenge.prize,
            ),
            ChallengeSectionCard(
              icon: Icons.schedule_outlined,
              title: 'Deadline',
              content: challenge.deadline,
            ),
            ChallengeSectionCard(
              icon: Icons.upload_file_outlined,
              title: 'Submission',
              content: challenge.submissionMethod,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Icons.description),
                  label: Text(
                    'Тех задания',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onPressed: () async {
                    final url = Uri.parse(challenge.techDocUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
