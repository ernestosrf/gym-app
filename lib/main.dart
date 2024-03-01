// import packages
// ignore_for_file: unused_import, duplicate_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/register.dart';
import 'firebase_options.dart';

// import pages
import 'login.dart';
import 'register.dart';
import 'home.dart';
import 'training.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TrainingPage(),
    );
  }
}
