import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:actsafe_ui/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActSafe',
      theme: AppTheme.theme,
      home: const HomePage(), // Set the initial screen to HomePage
    );
  }
}
