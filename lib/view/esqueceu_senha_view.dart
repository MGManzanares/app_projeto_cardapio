import 'package:app_projeto_cardapio/controller/login_controller.dart';
import 'package:flutter/material.dart';

class EsqeceuSenhaView extends StatefulWidget {
  const EsqeceuSenhaView({super.key});

  @override
  State<EsqeceuSenhaView> createState() => _EsqeceuSenhaViewState();
}

class _EsqeceuSenhaViewState extends State<EsqeceuSenhaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: msgKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('RECUPERAR SENHA', style: TextStyle(color: Colors.white)),
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
                key: formkey,
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
                      SizedBox(height: 25),
                      // Texto informativo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Digite o seu email para recuperar a senha'),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Campo para digitar o email
                      TextFormField(
                        controller: txtEmail,
                        decoration: InputDecoration(
                          labelText: 'Digite seu email:',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Botão para enviar o código de recuperação
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(320, 65),
                              backgroundColor: const Color.fromARGB(255, 94, 28, 16),
                              foregroundColor: Colors.white,
                              textStyle: TextStyle(fontSize: 25),
                            ),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                // Aqui você pode colocar a lógica de enviar o código por email
                                msgKey.currentState!.showSnackBar(
                                  SnackBar(
                                    content: Text('Código enviado para ${txtEmail.text}'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                LoginController().esqueceuSenha(context, txtEmail.text);
                              }
                            },
                            child: Text('Enviar código'),
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
      ),
    );
  }
}
