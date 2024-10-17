// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/cardapio.dart';
import '../view/cardapio_view.dart';

class Cart {
  List<MenuItem> items = [];

  void addItem(MenuItem item) {
    items.add(item);
  }

  void removeItem(MenuItem item) {
    items.remove(item);
  }

  void clear() {
    items.clear();
  }

  double get totalPrice => items.fold(0, (sum, item) => sum + item.price);
}

class MenuScreen extends StatelessWidget {
  final List<MenuItem> lanches = [
    MenuItem(
      name: 'Montanha',
      imagem: 'lib/images/montanha.jpg',
      price: 45.00,
      description: 'Um lanche generoso, 400g de carne bovina, queijo e acompanhamentos frescos, formando uma "montanha" de sabores.',
    ),
    MenuItem(
      name: 'Tradicional',
      imagem: 'lib/images/tradicional.jpg',
      price: 40.00,
      description: 'Um lanche clássico, simples e delicioso, com carne grelhada, queijo derretido e ingredientes frescos.',
    ),
    MenuItem(
      name: 'Baconlicioso',
      imagem: 'lib/images/bacon.jpg',
      price: 38.00,
      description: 'Um lanche irresistível com camadas generosas de bacon crocante, queijo derretido e molhos especiais.',
    ),
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

  final List<MenuItem> bebidas = [
    MenuItem(
      name: 'Refrigerante',
      imagem: 'lib/image/montanha.jpg',
      price: 5.00,
      description: 'Refrigerante gelado, perfeito para acompanhar seu lanche.',
    ),
    MenuItem(
      name: 'Suco Natural',
      imagem: 'lib/image/montanha.jpg',
      price: 7.00,
      description: 'Suco natural feito com frutas frescas.',
    ),
  ];

  final List<MenuItem> acompanhamentos = [
    MenuItem(
      name: 'Batata Frita',
      imagem: 'lib/images/batata.jpg',
      price: 15.00,
      description: 'Batatas fritas crocantes e deliciosas.',
    ),
    MenuItem(
  
      name: 'Onion Rings',
      imagem: 'lib/image/montanha.jpg',
      price: 12.00,
      description: 'Anéis de cebola empanados e fritos.',
    ),
  ];

  final Cart cart;

  MenuScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 46, 23, 22),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white,),
            onPressed: () {
              // Navega para a tela do carrinho
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart: cart), // Passando o carrinho
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 228, 218, 218),
      body: ListView(
        children: [
          CategorySection(title: 'Lanches', items: lanches, cart: cart),
          CategorySection(title: 'Bebidas', items: bebidas, cart: cart),
          CategorySection(title: 'Acompanhamentos', items: acompanhamentos, cart: cart),
        ],
      ),
    );
  }
}


