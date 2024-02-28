import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário cadastrado com sucesso!'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A senha é muito fraca.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('O e-mail já está em uso.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao cadastrar usuário.'),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          bottom: 50,
          left: 35,
          right: 35,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/imagens/gym_edit.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              // color: Colors.blueGrey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem-Vindo",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "Roboto, sans-serif",
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "ao",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: "Roboto, sans-serif",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Gym App!",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: "Roboto, sans-serif",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 57, 211, 54)
                        ),
                      ),
                    ]
                  ),
                  Text(
                    "Seu parceiro de academia",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto, sans-serif",
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFFFFFF),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.blueGrey.shade200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Registre-se agora",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Seu nome",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                        labelText: 'E-mail',
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Confirmar senha",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _registerUser(context),
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Roboto, sans-serif",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}