// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers
import 'package:flutter/material.dart';

class Login_App extends StatefulWidget {
  const Login_App({super.key});

  @override
  State<Login_App> createState() => _Login_AppState();
}

class _Login_AppState extends State<Login_App> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final msgKey = GlobalKey<ScaffoldMessengerState>();
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: msgKey,
        home: Scaffold(
            appBar: AppBar(
                title: Text('5 IRMÃOS LANCHES',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 46, 23, 22)),
            backgroundColor: Colors.amber,
              body: Padding(
                
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                    child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Icon(Icons.account_circle_rounded,
                                size: 200,
                                color: const Color.fromARGB(255, 188, 45, 2)),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: txtValor1,
                              decoration: InputDecoration(
                                labelText: 'Informe seu e-mail',
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
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: txtValor2,
                              decoration: InputDecoration(
                                  labelText: 'Informe sua senha:',
                                  labelStyle: TextStyle(
                                      color: Colors.black),
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
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(100, 60),
                                    backgroundColor: Colors.amber,
                                    foregroundColor:
                                         const Color.fromARGB(255, 63, 13, 6),
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                      Navigator.pushNamed(
                                          context, 'esqueceu_senha');
                                  },
                                  child: Text('esqueceu a senha?'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(198, 65),
                                    backgroundColor:
                                        const Color.fromARGB(255, 109, 28, 16),
                                    foregroundColor:
                                        Colors.white,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      Navigator.pushNamed(context, 'cardapio');
                                    }
                                  },
                                  child: Text('Entrar'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(155, 65),
                                    backgroundColor:
                                        const Color.fromARGB(255, 109, 28, 16),
                                    foregroundColor:
                                        Colors.white,
                                    textStyle: TextStyle(fontSize: 25),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'criar_conta');
                                  },
                                  child: Text('Cadastrar-se'),
                                ),
                              ],
                            )
                          ],
                        ))),
              ));
  }
}
