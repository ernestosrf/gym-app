// import packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

// import pages  
import 'login.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  void _registerUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                      Text(
                        " Gym App!",
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
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 50.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 0, style: BorderStyle.none)
                      ),
                      hintText: "Insira seu nome",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "E-mail",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Roboto, sans-serif",
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 113, 168, 112),
                    ),
                    controller: emailController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 50.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 0, style: BorderStyle.none)
                      ),
                      hintText: "email@exemplo.com",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Senha",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Roboto, sans-serif",
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 113, 168, 112),
                    ),
                    controller: passwordController,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      constraints: const BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 50.0,
                      ),
                      border:const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 0, style: BorderStyle.none)
                      ),
                      hintText: "Insira sua senha",
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _showPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                          color: const Color.fromARGB(255, 113, 168, 112),
                        ),
                      )
                    ),
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
                  TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 113, 168, 112),
                    ),
                    obscureText: _showConfirmPassword,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      constraints: const BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 50.0,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 0, style: BorderStyle.none)
                      ),
                      hintText: "Confirme sua senha",
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 113, 168, 112),
                      ),
                      suffixIcon: IconButton(
                        onPressed: _toggleConfirmPasswordVisibility,
                        icon: Icon(
                          _showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                          color: const Color.fromARGB(255, 113, 168, 112),
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => _registerUser(context),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 0, 0, 0),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                      minimumSize: MaterialStatePropertyAll(Size(double.infinity, 55.0))
                    ),
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Já tem uma conta?",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Roboto, sans-serif",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          " Faça login",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Roboto, sans-serif",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 57, 211, 54),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}