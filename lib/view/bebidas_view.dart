// ignore_for_file: use_key_in_widget_constructors

import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:app_projeto_cardapio/view/detalhes_view.dart';
import 'package:flutter/material.dart';

class BebidasView extends StatelessWidget {
  final List<MenuItem> bebidas = [
    MenuItem(
        name: 'Refrigerante',
        imagem: 'lib/images/refri.jpg',
        price: 5.00,
        description: 'Refrigerante gelado para refrescar.'),
    MenuItem(
        name: 'Suco Natural',
        imagem: 'lib/images/suco.jpg',
        price: 7.00,
        description: 'Suco natural feito com frutas frescas.'),
  ];

  final Cart cart;

  BebidasView({required this.cart});

  @override
  Widget build(BuildContext context) {
    return _buildCategoryScreen(context, 'Bebidas', bebidas, cart);
  }
  Widget _buildCategoryScreen(BuildContext context, String title, List<MenuItem> items, Cart cart) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title,style: TextStyle(color: Colors.white)),
        centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 96, 28, 16),
    ),
    body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: Image.asset(item.imagem, height: 100, width: 100),
          title: Text(item.name),
          subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhesView(menuItem: item, cart: cart),
              ),
            );
          },
        );
      },
    ),
  );
}
}