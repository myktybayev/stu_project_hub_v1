import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/constants/colors.dart';
import 'package:stu_project_hub/core/widgets/custom_challenge_card.dart';
import 'package:stu_project_hub/core/widgets/custom_typography.dart';
import 'package:stu_project_hub/features/challenge/presentation/pages/challenge_detail_screen.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stu_project_hub/di/service_locator.dart';
import 'package:stu_project_hub/features/challenge/store/challenge_store.dart';

class ChallengesScreen extends StatelessWidget {
  ChallengesScreen({Key? key}) : super(key: key);

  final challengeStore = serviceLocator<ChallengeStore>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionTitle('Challenges'),
            const SizedBox(height: 12),
            // Search field
            Observer(
              builder:
                  (_) => TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search challenges...',
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      isDense: true,
                    ),
                    onChanged: (val) => challengeStore.setSearch(val),
                  ),
            ),
            const SizedBox(height: 12),
            // Filter tags
            SizedBox(
              height: 36,
              child: Observer(
                builder:
                    (_) => ListView.separated(
                      key: ValueKey(challengeStore.selectedStatus),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: challengeStore.statuses.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final status = challengeStore.statuses[i];
                        final isSelected =
                            challengeStore.selectedStatus == status;
                        return ChoiceChip(
                          key: ValueKey(status),
                          label:
                              isSelected
                                  ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        status,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                  : Text(
                                    status,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          selected: isSelected,
                          selectedColor: AppColors.primary,
                          backgroundColor: const Color(0xFFE3E8F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (_) => challengeStore.setStatus(status),
                        );
                      },
                    ),
              ),
            ),
            const SizedBox(height: 16),
            // Challenge list
            Observer(
              builder: (_) {
                final filtered = challengeStore.filteredChallenges;
                if (filtered.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Center(
                      child: Text(
                        'No challenges found.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  );
                }
                return Column(
                  children:
                      filtered
                          .map(
                            (challenge) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ChallengeDetailScreen(
                                            challenge: challenge,
                                          ),
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
                                  buttonText:
                                      challenge.status == 'Finished'
                                          ? 'Winners'
                                          : 'Participate',
                                  buttonColor:
                                      challenge.status == 'Finished'
                                          ? const Color(0xFFFFD700)
                                          : AppColors.primary,
                                  participantsCount:
                                      challenge.participantsCount,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
