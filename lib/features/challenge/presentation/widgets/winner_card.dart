import 'package:flutter/material.dart';
import 'package:stu_project_hub/domain/entities/challenge_model.dart';

class WinnerCard extends StatelessWidget {
  final WinnerTeam winner;
  const WinnerCard({Key? key, required this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData medalIcon;
    Color medalColor;
    if (winner.place == 1) {
      medalIcon = Icons.emoji_events;
      medalColor = const Color(0xFFFFD700); // Gold
    } else if (winner.place == 2) {
      medalIcon = Icons.emoji_events;
      medalColor = const Color(0xFFC0C0C0); // Silver
    } else {
      medalIcon = Icons.emoji_events;
      medalColor = const Color(0xFFCD7F32); // Bronze
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      height: 270,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(medalIcon, color: medalColor, size: 48),
            const SizedBox(height: 8),
            Text(
              '${winner.place} место',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 6),
            Text(
              winner.prize,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              winner.teamName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            ...winner.students.map((s) => Text(s, textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }
}
