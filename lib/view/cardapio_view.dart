// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(CardapioView());
}

class CardapioView extends StatefulWidget {
  @override
  _CardapioViewState createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  Cart cart = Cart(); // Cart object to hold state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardápio do Restaurante',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(cart: cart), // Passing the cart to the MenuScreen
    );
  }
}

class MenuItem {
  final String name;
  final double price;
  final String description;


  MenuItem({
    required this.name,
    required this.price,
    required this.description,
  });
}

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
      price: 45.00,
      description: 'Um lanche generoso, 400g de carne bovina, queijo e acompanhamentos frescos, formando uma "montanha" de sabores.',
    ),
    MenuItem(
      name: 'Tradicional',
      price: 40.00,
      description: 'Um lanche clássico, simples e delicioso, com carne grelhada, queijo derretido e ingredientes frescos.',
    ),
    MenuItem(
      name: 'Baconlicioso',
      price: 38.00,
      description: 'Um lanche irresistível com camadas generosas de bacon crocante, queijo derretido e molhos especiais.',
    ),
    MenuItem(
      name: 'Amigão',
      price: 35.00,
      description: 'Um lanche amigável e acolhedor, repleto de carne suculenta, queijo, bacon e alface.',
    ),
    MenuItem(
      name: 'Trem da Felicidade',
      price: 100.00,
      description: 'Um combo completo com uma seleção de 3 lanches saborosos, garantindo uma viagem deliciosa de sabores e alegria.',
    ),
  ];

  final List<MenuItem> bebidas = [
    MenuItem(
      name: 'Refrigerante',
      price: 5.00,
      description: 'Refrigerante gelado, perfeito para acompanhar seu lanche.',
    ),
    MenuItem(
      name: 'Suco Natural',
      price: 7.00,
      description: 'Suco natural feito com frutas frescas.',
    ),
  ];

  final List<MenuItem> acompanhamentos = [
    MenuItem(
      name: 'Batata Frita',
      price: 15.00,
      description: 'Batatas fritas crocantes e deliciosas.',
    ),
    MenuItem(
      name: 'Onion Rings',
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

class CategorySection extends StatelessWidget {
  final String title;
  final List<MenuItem> items;
  final Cart cart;

  CategorySection({required this.title, required this.items, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final menuItem = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navega para a tela de detalhes do item
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuItemDetailScreen(menuItem: menuItem, cart: cart), // Passando o carrinho
                    ),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menuItem.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text('R\$ ${menuItem.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class MenuItemDetailScreen extends StatelessWidget {
  final MenuItem menuItem;
  final Cart cart;

  MenuItemDetailScreen({required this.menuItem, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Item',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              menuItem.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Preço: R\$ ${menuItem.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Descrição: ${menuItem.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adiciona o item ao carrinho
                cart.addItem(menuItem);
                Navigator.pop(context); // Volta para a tela anterior
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${menuItem.name} adicionado ao carrinho!'),
                ));
              },
              child: Text('Adicionar ao Carrinho'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _placeOrder() {
    setState(() {
      widget.cart.clear(); // Limpa o carrinho após fazer o pedido
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Pedido realizado com sucesso!'),
    ));
    Navigator.pop(context); // Volta ao menu após realizar o pedido
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 16, 46, 23),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 147, 240, 150),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Itens no Carrinho:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.items.length,
                itemBuilder: (context, index) {
                  final item = widget.cart.items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          widget.cart.removeItem(item);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${item.name} removido do carrinho!'),
                        ));
                      },
                    ),
                  );
                },
              ),
            ),
            Text(
              'Total: R\$ ${widget.cart.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.cart.items.isNotEmpty ? _placeOrder : null,
              child: Text('Fazer Pedido'),
            ),
          ],
        ),
      ),
    );
  }
}