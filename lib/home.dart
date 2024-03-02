// ignore_for_file: unused_import, duplicate_import, unnecessary_import, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/assets/bottomNavigator/bottomNavigator.dart';
import 'package:gym_app/assets/header/header.dart';
import 'package:gym_app/firestore_service.dart';
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
  final FirestoreService _firestoreService = FirestoreService();
  String? userId;

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    userId = await _firestoreService.getUserIdFromFirestore();
    setState(() {
      userId = userId;
    });
  }

  Future<void> deleteExercise(String exerciseId) async {
    try {
      await _firestoreService.deleteExercise(userId!, exerciseId);
    } catch (e) {
      print('Error deleting exercise: $e');
    }
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
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: userId != null
                    ? _firestoreService.getExercises(userId!)
                    : null,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var exercise = snapshot.data!.docs[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                exercise['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                        './assets/icons/pencil_square_icon.png',
                                        width: 20,
                                        ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TrainingPage(
                                            exerciseId:
                                                snapshot.data!.docs[index].id,
                                            exerciseName: exercise['name'],
                                            weight: exercise['weight'],
                                            reps: exercise['reps'],
                                            muscleGroup:
                                                exercise['muscleGroup'],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset(
                                        './assets/icons/delete_icon.png'),
                                    onPressed: () {
                                      deleteExercise(
                                          snapshot.data!.docs[index].id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 57, 211, 54),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
