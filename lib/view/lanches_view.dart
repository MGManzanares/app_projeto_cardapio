import 'package:app_projeto_cardapio/controller/Cardapio_controller.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:app_projeto_cardapio/view/detalhes_view.dart';

class LanchesView extends StatelessWidget {
  final Cart cart;

  LanchesView({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lanches', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 28, 16),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: CardapioController().listar(categoria: 'Lanches'),  // Carrega os lanches do Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados!'));
          }

          final docs = snapshot.data?.docs ?? [];
          final items = docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return MenuItem(
              name: data['nome'] ?? 'Nome não disponível',
              imagem: data['imagem'] ?? '',
              price: (data['preço'] is num ? data['preço'].toDouble() : 0.0),
              description: data['descrição'] ?? 'Descrição não disponível',
              ativo: data['ativo'] ?? true,
              categoria: data['categoria'] ?? 'Categoria não disponível',
            );
          }).toList();

          return _buildCategoryScreen(context, items, cart);
        },
      ),
    );
  }

  Widget _buildCategoryScreen(BuildContext context, List<MenuItem> items, Cart cart) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/cor.jpeg'), // Imagem de fundo
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.9), // Fundo levemente transparente para contraste
            child: ListTile(
              leading: Image.asset(item.imagem, height: 100, width: 100),
              title: Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'R\$ ${item.price.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.black54),
              ),
              
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesView(menuItem: item, cart: cart),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
