// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EsqeceuSenhaView extends StatefulWidget {
  const EsqeceuSenhaView({super.key});

  @override
  State<EsqeceuSenhaView> createState() => _EsqeceuSenhaViewState();
}

class _EsqeceuSenhaViewState extends State<EsqeceuSenhaView> {
   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final msgKey = GlobalKey<ScaffoldMessengerState>();
    var txtValor1 = TextEditingController();
    int s = 0;

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: msgKey,
        home: Scaffold(
            appBar: AppBar(
                title:
                    Text('MUDAR SENHA', style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 28, 88, 36)),
            body: Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                child: Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            child: Icon(Icons.question_mark_sharp,
                                size: 200,
                                color: const Color.fromARGB(255, 188, 45, 2)
                                ),
                      ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Escolha o método de recebimento do código'),
                              ],
                            ),
                            SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(155, 65),
                                    backgroundColor:
                                        Colors.red,
                                    foregroundColor:
                                        Colors.white,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                  onPressed: () {
                                    msgKey.currentState!.showSnackBar(
                                      SnackBar(content: Text('Código enviado ao email cadastrado! ${s.toStringAsFixed(2)}'),
                                      duration: Duration(seconds: 3),),
                                    );
                                  },
                                  child: Text('Email'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(155, 65),
                                    backgroundColor:
                                        Colors.red,
                                    foregroundColor:
                                        Colors.white,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                  onPressed: () {
                                    msgKey.currentState!.showSnackBar(
                                      SnackBar(content: Text('Código enviado ao telefone cadastrado! ${s.toStringAsFixed(2)}'),
                                      duration: Duration(seconds: 3),),
                                    );
                                  },
                                  child: Text('Telefone'),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 20,
                          ),
                    
                          TextFormField(
                            controller: txtValor1,
                            decoration: InputDecoration(
                              labelText: 'Escreva o código enviado:',
                              labelStyle: TextStyle(
                                  color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              } else if (double.tryParse(value) == null) {
                                return 'Informe um valor NUMÉRICO';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 100,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(320, 65),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  textStyle: TextStyle(fontSize: 25),
                                ),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.pushNamed(context, 'nova_senha');
                                  }
                                },
                                child: Text('Criar nova senha'),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                )
              )
            )
      );
  }
}
