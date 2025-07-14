import 'package:flutter/material.dart';

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
  final String techDocUrl;
  final int participantsCount;

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
    required this.techDocUrl,
    required this.participantsCount,
  });
}

class WinnerTeam {
  final int place;
  final String teamName;
  final String prize;
  final List<String> students;
  WinnerTeam({
    required this.place,
    required this.teamName,
    required this.prize,
    required this.students,
  });
}
