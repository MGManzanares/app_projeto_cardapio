import 'package:app_projeto_cardapio/controller/Cardapio_controller.dart';
import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:app_projeto_cardapio/view/detalhes_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BebidasView extends StatelessWidget {
  final Cart cart;

  BebidasView({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebidas', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 28, 16),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: CardapioController().listar(categoria: 'Bebidas'),
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
              name: data['nome'],
              description: data['descrição'],
              price: (data['preço'] as num).toDouble(),
              imagem: data['imagem'],
              ativo: data['ativo'],
              categoria: data['categoria']
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
          image: AssetImage('lib/images/cor.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.9),
            child: ListTile(
              leading: Image.asset(item.imagem, height: 100, width: 100, fit: BoxFit.cover),
              title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}',
               style: TextStyle(color: Colors.black54)),
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
