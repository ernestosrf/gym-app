import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatelessWidget {
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Registre-se agora",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Seu nome",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "E-mail",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Senha",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Confirmar senha",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto, sans-serif",
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      style: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: null,
                      child: Text(
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