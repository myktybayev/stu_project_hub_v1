import 'package:flutter/material.dart';
import '../../widgets/custom_typography.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/custom_tag.dart';
import '../../widgets/custom_card.dart';
import '../../config/colors.dart';
import 'package:stu_project_hub/models/project_model.dart';
import 'package:stu_project_hub/screens/home/project_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = [
      ProjectModel(
        title: 'Smart Home Automation',
        description:
            'A system to control home devices using voice commands and a mobile app.',
        imageUrl:
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
        category: 'IoT',
        githubLink: '',
        likes: 128,
        commentsCount: 0,
        screenshots: [],
        comments: [],
      ),
      ProjectModel(
        title: 'AI-Powered Study Buddy',
        description:
            'An intelligent assistant that helps students with their studies and assignments.',
        imageUrl:
            'https://images.unsplash.com/photo-1464983953574-0892a716854b',
        category: 'AI',
        githubLink: '',
        likes: 95,
        commentsCount: 2,
        screenshots: [
          'https://i.imgur.com/1Q9Z1Zm.png',
          'https://i.imgur.com/2nCt3Sbl.jpg',
        ],
        comments: [
          ProjectComment(
            authorName: 'Alice Johnson',
            authorAvatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
            text:
                'This is such a great idea! I really need something like this for my exams.',
          ),
          ProjectComment(
            authorName: 'Bob Smith',
            authorAvatarUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
            text:
                'Will it integrate with Google Scholar? That would be amazing.',
          ),
        ],
      ),
      ProjectModel(
        title: 'Campus Ride-Share App',
        description:
            'Connects students for carpooling within and around the campus.',
        imageUrl:
            'https://images.unsplash.com/photo-1518717758536-85ae29035b6d',
        category: 'Mobile',
        githubLink: '',
        likes: 210,
        commentsCount: 0,
        screenshots: [],
        comments: [],
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionTitle('Project Ideas'),
            const SizedBox(height: 16),
            const CustomInputField(hintText: 'Search projects...'),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CustomTag(
                    text: 'All',
                    color: AppColors.primary,
                    textColor: Colors.white,
                  ),
                  CustomTag(
                    text: 'Mobile',
                    color: Color(0xFFE3E8F0),
                    textColor: Colors.black,
                  ),
                  CustomTag(
                    text: 'Web',
                    color: Color(0xFFE3E8F0),
                    textColor: Colors.black,
                  ),
                  CustomTag(
                    text: 'Bot',
                    color: Color(0xFFE3E8F0),
                    textColor: Colors.black,
                  ),
                  CustomTag(
                    text: 'AI',
                    color: Color(0xFFE3E8F0),
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ...projects.map(
              (project) => CustomCard(
                imageUrl: project.imageUrl,
                title: project.title,
                category: project.category,
                description: project.description,
                likes: project.likes,
                commentsCount: project.commentsCount,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProjectDetailsScreen(project: project),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
