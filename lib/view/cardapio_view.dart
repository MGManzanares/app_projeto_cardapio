import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:app_projeto_cardapio/view/acompanhamentos_view.dart';
import 'package:app_projeto_cardapio/view/bebidas_view.dart';
import 'package:app_projeto_cardapio/view/carrinho_view.dart';
import 'package:app_projeto_cardapio/view/lanches_view.dart';
import 'package:flutter/material.dart';

class CardapioView extends StatelessWidget {
  final Cart cart = Cart(); // Instância de Cart compartilhada

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardápio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(cart: cart), // Passa o Cart para a HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Cart cart;

  HomeScreen({required this.cart}); // Recebe o Cart como parâmetro

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
              // Navega para a tela do Carrinho
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarrinhoView(cart: cart)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Exibe um diálogo de confirmação para logout
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/cor.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo
                  Image.asset(
                    'lib/images/logo1.png', 
                    height: 200,
                    width: 250,
                  ),
                  SizedBox(height: 20),
                  // Botões para categorias
                  _buildCategoryButton(context, 'Lanches', LanchesView(cart: cart)),
                  _buildCategoryButton(context, 'Bebidas', BebidasView(cart: cart)),
                  _buildCategoryButton(context, 'Acompanhamentos', AcompanhamentosView(cart: cart)),
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
          // Navega para a tela da categoria
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Você deseja realmente sair?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('Sair'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.of(context).pushReplacementNamed('/'); // Redireciona para a tela inicial
              },
            ),
          ],
        );
      },
    );
  }
}