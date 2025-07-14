// AppTextStyles: мәтін стильдері
// Барлық мәтін стильдерін осы файлда сақтаңыз.

import 'package:flutter/material.dart';
import 'package:stu_project_hub/core/constants/colors.dart';

class AppTextStyles {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
  );

  static const TextStyle muted = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  static const TextStyle tagDesign = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );
  static const TextStyle tagNew = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const TextStyle tagActive = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
