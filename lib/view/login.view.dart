// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import
import 'package:app_projeto_cardapio/controller/login_controller.dart';
import 'package:flutter/material.dart';

import 'cardapio_view.dart';

class Login_App extends StatefulWidget {
  const Login_App({super.key});

  @override
  State<Login_App> createState() => _Login_AppState();
}

class _Login_AppState extends State<Login_App> {
  // Controllers para capturar os valores digitados
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();
  final txtNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '5 IRMÃOS LANCHES',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 94, 28, 16),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/cor.jpeg'), // Imagem de fundo
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: Form(
              child: Column(
                children: [
                  Image.asset(
                    'lib/images/logo1.png',
                    height: 200,
                    width: 250,
                  ),
                  SizedBox(height: 50),
                  // Campo de texto para o login
                  TextFormField(
                    controller: txtEmail, // Associando o controller
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Login: ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 10, 53, 224),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Campo de texto para a senha
                  TextFormField(
                    controller: txtSenha, // Associando o controller
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Senha: ',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 10, 53, 224),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, 'esqueceu_senha')},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      child: Text(
                        "Recuperar Senha",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // Botão de Login
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 65),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 96, 28, 16),
                      textStyle: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      // Captura os valores dos campos
                      String email = txtEmail.text.trim();
                      String senha = txtSenha.text.trim();

                      // Validação simples
                      if (email.isEmpty || senha.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'E-mail e senha não podem estar vazios.',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Chama o método de login
                      LoginController().login(context, email, senha);
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botão para criar conta
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 65),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 96, 28, 16),
                      textStyle: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'criar_conta');
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
