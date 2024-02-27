import 'package:flutter/material.dart';

void main() {
  runApp(buildApp());
}

Widget buildApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 600), // Adjust this value as per your requirement
          child: Stack(
            children: <Widget>[
              Image.asset('../assets/imagens/gym_edit.jpg'),
              Positioned(
                top: 50.0,
                left: 16.0,
                right: 16.0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.yellow,
                        width: 3,
                      ),
                    ),
                    child: const Text(
                      'Gym App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 175.0,
                left: 16.0,
                right: 16.0,
                child: Center(
                  child: Text(
                    'Novo por aqui?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 220.0,
                left: 16.0,
                right: 16.0,
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Usuário apertou "Resgistrar-se"');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.7)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Registrar-se',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 285.0,
                left: 16.0,
                right: 16.0,
                child: Center(
                  child: Text(
                    'Já é membro?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 320.0,
                left: 16.0,
                child: Center(
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 350.0,
                left: 16.0,
                right: 16.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ex.: meuemail@gymapp.com',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                top: 420.0,
                left: 16.0,
                child: Center(
                  child: Text(
                    'Senha',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 450.0,
                left: 16.0,
                right: 16.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ex.: **********',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 520.0,
                left: 16.0,
                child: GestureDetector(
                  onTap: () {
                    print('Usuário apertou "Esqueci minha senha"');
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Esqueci minha senha',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 550.0,
                left: 16.0,
                right: 16.0,
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Usuário apertou "Entrar"');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.7)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
