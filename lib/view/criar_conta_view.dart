// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CriarContaView extends StatefulWidget {
  const CriarContaView({super.key});

  @override
  State<CriarContaView> createState() => _CriarContaViewState();
}

class _CriarContaViewState extends State<CriarContaView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtValor3 = TextEditingController();
  var txtValor4 = TextEditingController();
  var txtValor5 = TextEditingController();
  var txtValor6 = TextEditingController();
  int s = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: msgKey,
        home: Scaffold(
            appBar: AppBar(
                title:
                    Text('CRIAR CONTA', style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 94, 28, 16)),
            body:Container(
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
                          Image.asset(
                         'lib/images/logo1.png',
                         height: 200, 
                         width: 250,),
                          
                          SizedBox(height: 5),
                          TextFormField(
                            controller: txtValor1,
                            decoration: InputDecoration(
                              labelText: 'Nome de usuário',
                              labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 96, 28, 16)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: txtValor2,
                            decoration: InputDecoration(
                                labelText: 'Informe seu email:',
                                labelStyle: TextStyle(
                                    color: const Color.fromARGB(255, 96, 28, 16)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            validator: (value) {
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: txtValor3,
                            decoration: InputDecoration(
                              labelText: 'Informe sua senha',
                              labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 96, 28, 16)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: txtValor4,
                            decoration: InputDecoration(
                              labelText: 'Confirmar senha',
                              labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 96, 28, 16)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: txtValor5,
                            decoration: InputDecoration(
                              labelText: 'Endereço',
                              labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 96, 28, 16)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Informe um valor';
                              } else if (value.isEmpty) {
                                return 'Informe um valor';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: txtValor6,
                            decoration: InputDecoration(
                              labelText: 'Telefone',
                              labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 96, 28, 16)),
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
                          SizedBox(
                            height: 10,
                          ),
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
                                  if (formkey.currentState!.validate()) {
                                   msgKey.currentState!.showSnackBar(
                                      SnackBar(content: Text('Cadastro realizado com sucesso! ${s.toStringAsFixed(2)}'),
                                      duration: Duration(seconds: 3),),
                                     );
                                  }
                                },
                                child: Text('Salvar'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
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
                          )
                        ],
                      ),
                  )
              )
           )
        )
     ),
    ),
   );
  }
}
