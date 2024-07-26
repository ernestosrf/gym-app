// Imports
import 'package:flutter/material.dart';
import 'package:gym_app/theme/theme.dart';
import 'pages/home/home.dart';

// Components

// Images

// Styles

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
