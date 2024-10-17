// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'cardapio_view.dart';



class Login_App extends StatefulWidget {
  const Login_App({super.key});

  @override
  State<Login_App> createState() => _Login_AppState();
}

class _Login_AppState extends State<Login_App> {
  final _formKey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  
  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      const String emailValido = 'Gordao@gordoadm.com';
      const String senhaValida = 'gordo123';

      if (_emailController.text == emailValido && _senhaController.text == senhaValida) {
        Navigator.push(context,
         MaterialPageRoute(builder: 
         (context) => CardapioView()
         ),
        );
      } else {
        
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('E-mail ou senha incorretos.'),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
        ),
      );
    }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Favor informar dados válidos!',
          style: TextStyle(fontSize: 14, color: Colors.red),
          ),          
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: Scaffold(
            appBar: AppBar(
                title: Text('5 IRMÃOS LANCHES',
                  style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 94, 28, 16)),
            //backgroundColor: const Color.fromARGB(255, 221, 170, 16),
              body:Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('lib/images/cor.jpeg'), // Imagem de fundo
                       fit: BoxFit.cover,
                     ),
          ), 
    child: Center(
      child:Padding(      
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              
              Image.asset(
                         'lib/images/logo1.png',
                         height: 200, 
                        width: 250,),
              SizedBox(height: 50),
              TextFormField(
                controller: _emailController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _senhaController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha.';
                  }
                  return null;
                },
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => {Navigator.pushNamed(context, 'esqueceu_senha')},
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
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color.fromARGB(255, 96, 28, 16),
                      Color.fromARGB(255, 94, 27, 12),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: _validateForm,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Entrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color.fromARGB(255, 96, 28, 16),
                      Color.fromARGB(255, 94, 27, 12),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () => {Navigator.pushNamed(context, 'criar_conta')},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    ),),);
  }
}
