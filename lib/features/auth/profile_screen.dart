import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/widgets/custom_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          const CustomAvatar(
            imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
            size: 88,
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 4),
          const Text(
            'john.doe@example.edu',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: const Color(0xFFFAFAFA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lightbulb_outline),
                    title: const Text(
                      'My Ideas',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.bookmark_border),
                    title: const Text(
                      'Saved Ideas',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text(
                      'Help & Support',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  const Divider(height: 0),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
