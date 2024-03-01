import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/assets/header/header.dart';
import 'firebase_options.dart';

import 'assets/header/header.dart';

// ignore: use_key_in_widget_constructors
class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrainingPage createState() => _TrainingPage();
}

class _TrainingPage extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Meus treinos",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}