// Imports
import 'package:flutter/material.dart';

// Components
import 'package:gym_app/components/Buttons/custom_button.dart';

// Images

// Styles

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttomRadius = MediaQuery.of(context).size.width * 0.20;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gym App',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration:  BoxDecoration(
                color: Colors.white, // trocar aqui
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(buttomRadius),
                  topRight: Radius.circular(buttomRadius),
                ),
              ),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Iniciar sessão',
                    isLoading: false,
                    loadingType: "teste",
                    loadingTypeValor: "teste",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Button Pressed!')),
                      );
                    },
                    style: {
                      'width': MediaQuery.of(context).size.width * 0.60,
                      'height': MediaQuery.of(context).size.height * 0.065,
                      'backgroundColor': Colors.blue,
                      'borderWidth': 0.0,
                      'borderRadius': 10.0,
                      'borderColor': Colors.blue,
                      'fontStyle': 400,
                      'fontSize': 16.0,
                      'textColor': Colors.white,
                    },
                  ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}