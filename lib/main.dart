import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/theme/theme.dart';
import 'package:stu_project_hub/navigation/main_navigation_screen.dart';
import 'package:stu_project_hub/di/service_locator.dart';

void main() {
  setupLocator();
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
