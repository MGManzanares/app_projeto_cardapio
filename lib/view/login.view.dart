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
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtEmailEsqueceuSenha = TextEditingController();

  @override
  void initState() {
   // txtEmail.text = 'joao@email.com';
   // txtSenha.text = '123456';
    super.initState();
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
            child: Column(
            children: [
              
              Image.asset(
                         'lib/images/logo1.png',
                         height: 200, 
                        width: 250,),
              SizedBox(height: 50),
              TextFormField(
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
               ElevatedButton(
                           style: ElevatedButton.styleFrom(
                              minimumSize:  Size(320, 65), 
                              foregroundColor: Colors.white, 
                              backgroundColor: const Color.fromARGB(255, 96, 28, 16),
                              textStyle: TextStyle(fontSize: 25),
                              

                            ),

                            
                           onPressed: () {
                                        //
                             // TO-DO: Login
                             //
                             LoginController().login(
                               context,
                               txtEmail.text,
                               txtSenha.text,
                             );
                            },
                            child: Text('Entrar',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),),
                          ),
              SizedBox(height: 20),
              ElevatedButton(
                           style: ElevatedButton.styleFrom(
                              minimumSize:  Size(320, 65), 
                              foregroundColor: Colors.white, 
                              backgroundColor: const Color.fromARGB(255, 96, 28, 16),
                              textStyle: TextStyle(fontSize: 25),
                              

                            ),

                            
                           onPressed: () {
                             Navigator.pushNamed(context, 'criar_conta');
                            },
                            child: Text('Cadastar',
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
     ),
    
   );
  }
}
