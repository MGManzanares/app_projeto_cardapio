// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_statements, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class NovaSenhaView extends StatefulWidget {
  const NovaSenhaView({super.key});

  @override
  State<NovaSenhaView> createState() => _NovaSenhaViewState();
}

class _NovaSenhaViewState extends State<NovaSenhaView> {
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
                    Text('CRIAR NOVA SENHA', style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 94, 28, 16)
                ),
                
            body: Container(
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
                    key: formkey,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                           Icon(Icons.security_rounded,
                                size: 200,
                                color: const Color.fromARGB(255, 94, 28, 16)),
                                SizedBox(height: 115),
                      TextFormField(
                            controller: txtValor1,
                            decoration: InputDecoration(
                              labelText: 'Escreva a nova senha:',
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
                              } else if (double.tryParse(value) == null);
                              return null;
                            },
                          ),
                            SizedBox(height: 115),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(320, 65),
                                    backgroundColor:
                                        const Color.fromARGB(255, 94, 28, 16),
                                    foregroundColor:
                                        Colors.white,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                    msgKey.currentState!.showSnackBar(
                                      SnackBar(content: Text('Nova senha criada! ${s.toStringAsFixed(2)}'),
                                      duration: Duration(seconds: 3),),
                                     );
                                    }
                                  },
                                  child: Text('Confirmar senha'),
                                ),
                              ],
                            ),
                          SizedBox(height: 15,),
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
                                    Navigator.pushNamed(context, 'login');
                                  }
                                },
                                child: Text('Voltar para a tela inicial'),
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
