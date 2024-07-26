// import packages
// ignore_for_file: avoid_print, use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import pages
import 'register.dart';
import 'home1.dart';

// ignore: use_key_in_widget_constructors

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      passwordHintText = _obscureText ? '' : 'minhasenha';
    });
  }

  void _loginUser(BuildContext context) async {
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   );
    //   print("Usuário conectado!");
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomePage()),
    //   );
    // } on FirebaseAuthException catch (e) {
    //   print(e.code);
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: const Text('Erro de autenticação'),
    //       content: Text(_getErrorMessage(e.code)),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  void _forgotPassword() async {
    if (emailController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro ao solicitar recuperação de senha'),
          content: const Text(
              "Digite seu email para solicitar recuperação de senha."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // try {
    //   await FirebaseAuth.instance
    //       .sendPasswordResetEmail(email: emailController.text);
    //   print("Email de recuperação de senha enviado!");

    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: const Text('Recuperação de senha'),
    //       content: const Text("Email de recuperação de senha enviado!"),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // } on FirebaseAuthException catch (e) {
    //   print(e.code);
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: const Text('Recuperação de senha'),
    //       content:
    //           const Text("Erro ao enviar o email de recuperação de senha."),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'E-mail não cadastrado/inválido';
      case 'wrong-password':
        return 'Senha incorreta';
      case 'invalid-credential':
        return 'Credenciais inválidas (e-mail ou senha errados)';
      case 'missing-password':
        return 'Senha não informada';
      default:
        return 'Ocorreu um erro durante a autenticação. Por favor, tente novamente mais tarde.';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                './assets/images/gym_edit.jpg',
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
                                      builder: (context) =>
                                          const RegisterPage()),
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
                                decoration: InputDecoration(
                                  hintText: 'meuemail@gymapp.com',
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 57, 211, 54)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
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
                                      color: const Color.fromARGB(255, 57, 211, 54),
                                    ),
                                    onPressed: _togglePasswordVisibility,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onSubmitted: (_) => _loginUser(context),
                              ),
                              InkWell(
                                onTap: _forgotPassword,
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
