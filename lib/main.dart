import 'package:flutter/material.dart';
import 'package:stu_project_hub/screens/navigation/main_navigation_screen.dart';
import 'config/theme.dart';
// TODO: AppColors-ты config/colors.dart арқылы қолдану

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Projects Hub',
      theme: AppTheme.light,
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
