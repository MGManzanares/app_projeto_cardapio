// ignore_for_file: use_key_in_widget_constructors

import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:app_projeto_cardapio/view/detalhes_view.dart';
import 'package:flutter/material.dart';

class LanchesView extends StatelessWidget {
  final List<MenuItem> lanches = [
    MenuItem(
        name: 'Montanha',
        imagem: 'lib/images/montanha.jpg',
        price: 45.00,
        description: '400g de carne bovina com queijo e acompanhamentos frescos.'),
    MenuItem(
        name: 'Tradicional',
        imagem: 'lib/images/tradicional.jpg',
        price: 40.00,
        description: 'Lanche clássico com carne grelhada e queijo.'),
    MenuItem(
      name: 'Amigão',
      imagem: 'lib/images/amigao.jpg',
      price: 35.00,
      description: 'Um lanche amigável e acolhedor, repleto de carne suculenta, queijo, bacon e alface.',
    ),
    MenuItem(
      name: 'Trem da Felicidade',
      imagem: 'lib/images/trem.jpg',
      price: 100.00,
      description: 'Um combo completo com uma seleção de 3 lanches saborosos, garantindo uma viagem deliciosa de sabores e alegria.',
    ),
  ];

  final Cart cart;

  LanchesView({required this.cart});

  @override
  Widget build(BuildContext context) {
    return _buildCategoryScreen(context, 'Lanches', lanches, cart);
  }

  Widget _buildCategoryScreen(BuildContext context, String title, List<MenuItem> items, Cart cart) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 28, 16),
      ),
      body: Container(
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
      ),
    );
  }
}
