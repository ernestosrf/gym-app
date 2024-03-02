// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: use_key_in_widget_constructors
class Header extends StatefulWidget {
  const Header({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Header createState() => _Header();
}

class _Header extends State<Header> {
  String userName = ' username!';

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  fetchUserName() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    print('User uid: ${user.uid}'); // Add this line
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user.email).get();
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic>? data = querySnapshot.docs.first.data() as Map<String, dynamic>?;
        if (data != null && data.containsKey('name')) {
          setState(() {
            userName = data['name'];
          });
        } else {
          print('No name field found in document');
        }
      } else {
        print('No document found for user');
      }
    } catch (e) {
      print('Error getting user name: $e');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
      ),
      title: Column(
        children: [
          const Text('Gym App',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 57, 211, 54))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bem-Vindo, ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text(userName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 57, 211, 54))),
            ],
          ),
        ],
      ),
    );
  }
}
