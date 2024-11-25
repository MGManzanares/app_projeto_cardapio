// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable
import 'package:app_projeto_cardapio/view/cardapio_view.dart';
import 'package:app_projeto_cardapio/view/criar_conta_view.dart';
import 'package:app_projeto_cardapio/view/esqueceu_senha_view.dart';
import 'package:app_projeto_cardapio/view/login.view.dart';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necessário antes de inicializar o Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true, // Certifique-se de que está ativado para visualização
      builder: (context) => MainApp(), // Passe o context correto
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) =>Login_App(),
        'criar_conta': (context) => CadastrarView(),
        'cardapio': (context) => CardapioView(),
        'esqueceu_senha': (context) => EsqeceuSenhaView(),
        
        
      }
    );
  }
}
      