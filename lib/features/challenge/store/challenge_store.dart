import 'package:mobx/mobx.dart';
import 'package:stu_project_hub/domain/entities/challenge_model.dart';
import 'package:flutter/material.dart';

part 'challenge_store.g.dart';

class ChallengeStore = _ChallengeStore with _$ChallengeStore;

abstract class _ChallengeStore with Store {
  @observable
  ObservableList<ChallengeModel> allChallenges = ObservableList.of([
    ChallengeModel(
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      title: 'Sustainable Campus Initiative',
      status: 'Active',
      statusColor: Colors.green,
      description:
          'Develop innovative solutions for reducing waste and energy consumption on campus.',
      goal: 'The primary goal is to foster a greener campus environment.',
      customerInfo: 'Sponsored by the University.',
      prize: 'Grant and mentorship.',
      deadline: 'Due: Oct 30, 2024',
      submissionMethod: 'Submit via portal.',
      participantsCount: 120,
      techDocUrl: 'https://example.com/techdoc1',
    ),
    ChallengeModel(
      imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b',
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
      participantsCount: 87,
      techDocUrl: 'https://example.com/ai-accessibility',
    ),
    ChallengeModel(
      imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b',
      title: 'AI for Accessibility',
      status: 'Upcoming',
      statusColor: Colors.orange,
      description:
          'Create AI-powered tools to assist students with disabilities.',
      goal: 'Goal for this challenge.',
      customerInfo: 'Customer info for this challenge.',
      prize: 'Prize details.',
      deadline: 'Due: Nov 15, 2024',
      submissionMethod: 'Submission method details.',
      participantsCount: 45,
      techDocUrl: 'https://example.com/ai-upcoming',
    ),
    ChallengeModel(
      imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      title: 'Community Engagement Platform',
      status: 'Finished',
      statusColor: Colors.grey,
      description:
          'Build a platform to connect students with local volunteer opportunities.',
      goal: 'Goal for this challenge.',
      customerInfo: 'Customer info for this challenge.',
      prize: 'Prize details.',
      deadline: 'Finished: Dec 1, 2023',
      submissionMethod: 'Submission method details.',
      participantsCount: 200,
      techDocUrl: 'https://example.com/community-engagement',
    ),
  ]);

  @observable
  String search = '';

  @observable
  String selectedStatus = 'All';

  @computed
  List<String> get statuses => ['All', 'Active', 'Upcoming', 'Finished'];

  @computed
  List<ChallengeModel> get filteredChallenges {
    return allChallenges.where((challenge) {
      final matchesStatus =
          selectedStatus == 'All' || challenge.status == selectedStatus;
      final matchesSearch =
          search.isEmpty ||
          challenge.title.toLowerCase().contains(search) ||
          challenge.description.toLowerCase().contains(search);
      return matchesStatus && matchesSearch;
    }).toList();
  }

  @action
  void setSearch(String val) => search = val.trim().toLowerCase();

  @action
  void setStatus(String status) => selectedStatus = status;
}
