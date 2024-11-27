// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:app_projeto_cardapio/model/cardapio.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:flutter/material.dart';

class DetalhesView extends StatelessWidget {
  final MenuItem menuItem;
  final Cart cart;

  DetalhesView({required this.menuItem, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuItem.name, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 28, 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(menuItem.imagem, height: 300, fit: BoxFit.cover),
            Text(menuItem.description),
            Text('Preço: R\$ ${menuItem.price.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                cart.addItem(menuItem);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${menuItem.name} adicionado ao carrinho!')),
                );
              },
              child: Text('Adicionar ao Carrinho'),
            ),
          ],
        ),
      ),
    );
  }
}