// import packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import pages
import 'register.dart';
import 'home.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  String passwordHintText = '**********';

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
      passwordHintText = _obscureText ? '**********' : 'minhasenha';
    });
  }

  void _loginUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao fazer login.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                '../assets/imagens/gym_edit.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          width: double.infinity,
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
                              Row(children: [
                                Text(
                                  "ao",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: "Roboto, sans-serif",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                Text(
                                  " Gym App!",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontFamily: "Roboto, sans-serif",
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 57, 211, 54)),
                                ),
                              ]),
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
                        const SizedBox(height: 50.0),
                        const Text(
                          'Novo por aqui?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.black.withOpacity(0.7)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(10.0)),
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
                                'Registre-se agora',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 57, 211, 54),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Já tem uma conta?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              TextField(
                                controller: emailController,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 57, 211, 54)),
                                decoration: const InputDecoration(
                                  hintText: 'meuemail@gymapp.com',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 57, 211, 54)),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Senha',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              TextField(
                                controller: passwordController,
                                obscureText: _obscureText,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 57, 211, 54)),
                                decoration: InputDecoration(
                                  hintText: passwordHintText,
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 57, 211, 54)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color.fromARGB(
                                          255, 57, 211, 54),
                                    ),
                                    onPressed: _togglePasswordVisibility,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print(
                                      'Usuário apertou "Esqueci minha senha"');
                                },
                                child: const Text(
                                  'Esqueci minha senha',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromARGB(255, 57, 211, 54),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () => _loginUser(context),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black.withOpacity(0.7)),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(10.0)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                        color: Color.fromARGB(255, 57, 211, 54),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
