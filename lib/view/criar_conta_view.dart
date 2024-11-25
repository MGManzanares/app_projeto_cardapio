// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import 'componentes/text_fild.dart';

class CadastrarView extends StatefulWidget {
  const CadastrarView({super.key});

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

class _CadastrarViewState extends State<CadastrarView> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CRIAR CONTA', style: TextStyle(color: Colors.white)),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // Logo
                    Image.asset(
                      'lib/images/logo1.png',
                      height: 200,
                      width: 250,
                    ),
                    SizedBox(height: 20),

                    // Campos de entrada
                    campoTexto('Nome', txtNome, Icons.person),
                    SizedBox(height: 10),
                    campoTexto('Email', txtEmail, Icons.email),
                    SizedBox(height: 10),
                    campoTexto('Senha', txtSenha, Icons.lock, senha: true),
                    SizedBox(height: 10),

                    // Botões
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(320, 65),
                            backgroundColor:
                                const Color.fromARGB(255, 96, 28, 16),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                          
                              LoginController().criarConta(
                                context,
                                txtNome.text,
                                txtEmail.text,
                                txtSenha.text,
                              );
                              
                            
                          },
                          child: Text('Salvar'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(320, 65),
                            backgroundColor:
                                const Color.fromARGB(255, 96, 28, 16),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Voltar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
