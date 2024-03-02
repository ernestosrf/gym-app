// ignore_for_file: avoid_print
import 'dart:async';

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
  String userName = ' Username!';
  StreamSubscription<User?>? authStateSubscription;

  @override
  void initState() {
    super.initState();
    authStateSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      fetchUserName();
    });
    fetchUserName();
  }

  @override
  void dispose() {
    authStateSubscription?.cancel();
    super.dispose();
  }

  fetchUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user.email).get();
        if (querySnapshot.docs.isNotEmpty) {
          Map<String, dynamic>? data = querySnapshot.docs.first.data() as Map<String, dynamic>?;
          setState(() {
            userName = data != null && data.containsKey('name') ? data['name'] + "!" : 'Username!';
          });
        }
      } catch (e) {
        print('Error getting username: $e');
      }
    } else {
      setState(() {
        userName = 'Desconectado!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      title: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                print(FirebaseAuth.instance
                    .currentUser); // Deve imprimir null se o usuário foi desconectado com sucesso
              },
            ),
          ),
        ],
      ),
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
    );
  }
}
