import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'acompanhamentos_view.dart';
import 'package:app_projeto_cardapio/view/bebidas_view.dart';
import 'package:app_projeto_cardapio/view/carrinho_view.dart';
import 'package:app_projeto_cardapio/view/lanches_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CardapioView());
}

class CardapioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardápio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Cart cart = Cart(); // Carrinho compartilhado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 28, 16),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarrinhoView(cart: cart)),
              );
            },
          ),
        ],
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
                  _buildCategoryButton(context, 'Lanches', LanchesView(cart: cart)),
                  _buildCategoryButton(context, 'Bebidas', BebidasView(cart: cart)),
                  _buildCategoryButton(
                      context, 'Acompanhamentos', AcompanhamentosView(cart: cart)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 50),
          backgroundColor: Colors.amber,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
