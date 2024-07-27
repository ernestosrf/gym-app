// Imports
import 'package:flutter/material.dart';
import 'package:gym_app/pages/auth/login.dart';
import 'package:gym_app/pages/auth/register.dart';

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
                      color: Color(0xFF39D336),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration:  BoxDecoration(
                // color: Theme.of(context).scaffoldBackgroundColor,
                color: Colors.white, // tirar essa linha dps
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(buttomRadius),
                  topRight: Radius.circular(buttomRadius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Iniciar sessão',
                    isLoading: false,
                    loadingType: "teste",
                    loadingTypeValor: "teste",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage()
                        ),
                      );
                    },
                    style: {
                      'width': MediaQuery.of(context).size.width * 0.55,
                      'height': MediaQuery.of(context).size.height * 0.050,
                      'backgroundColor': Colors.blue,
                      'borderWidth': 0.0,
                      'borderRadius': 10.0,
                      'borderColor': Colors.blue,
                      'fontStyle': 400,
                      'fontSize': 16,
                      'textColor': Colors.white,
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Text(
                            'Não tem uma conta?',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.5,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Inscrever-se',
                            style: TextStyle(
                              color: Color(0xFF39D336),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 10.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}