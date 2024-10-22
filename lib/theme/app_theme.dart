import 'package:flutter/material.dart';

// Custom color palette
class AppColors {
  static const Color darkBlue = Color(0xFF002D62);
  static const Color lightBlue = Color(0xFF87CEFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color mediumBlue = Color(0xFF005B96);
  static const Color lightGray = Color(0xFFF0F0F0);
}

// Theme data
class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.darkBlue,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.darkBlue,
        secondary: AppColors.lightBlue,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.darkBlue, // Background color of button
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: AppColors.darkBlue,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: AppColors.darkBlue,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),
        labelLarge: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.darkBlue,
        titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white, backgroundColor: AppColors.darkBlue,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkBlue, side: BorderSide(color: AppColors.darkBlue),
        ),
      ),
    );
  }
}
