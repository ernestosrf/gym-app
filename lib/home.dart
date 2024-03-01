// ignore_for_file: unused_import, duplicate_import, unnecessary_import, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/assets/bottomNavigator/bottomNavigator.dart';
import 'package:gym_app/assets/header/header.dart';
import 'package:gym_app/training.dart';
import 'firebase_options.dart';

import 'assets/header/header.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> documentIds = [];

  // get document IDs
  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            print(element.reference);
          }),
        );
  }

  @override
  void initState() {
    getDocIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Header(),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 35,
          bottom: 35,
          left: 35,
          right: 35,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Meus treinos",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrainingPage()),
                    );
                  },
                  child: const Icon(
                    Icons.add_box_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
