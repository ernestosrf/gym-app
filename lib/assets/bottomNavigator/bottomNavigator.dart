// ignore_for_file: unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../home.dart';
import '../../training.dart';

// ignore: use_key_in_widget_constructors
class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigator createState() => _BottomNavigator();
}

class _BottomNavigator extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Treinos',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 57, 211, 54),
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TrainingPage()),
          );
        }
      },
    );
  }
}