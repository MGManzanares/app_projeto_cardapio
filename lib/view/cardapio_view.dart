// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../model/cardapio.dart';
import '../service/cardapio_service.dart';



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
      title: 'Cardápio ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(cart: cart), // Passing the cart to the MenuScreen
    );
  }
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
      imagem: 'lib/images/refri.jpg',
      price: 5.00,
      description: 'Refrigerante gelado, perfeito para acompanhar seu lanche.',
    ),
    MenuItem(
      name: 'Suco Natural',
      imagem: 'lib/images/suco.jpg',
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
      imagem: 'lib/images/onion.jpg',
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
                backgroundColor: const Color.fromARGB(255, 96, 28, 16),
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
      
      body: Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('lib/images/cor.jpeg'), // Imagem de fundo
                       fit: BoxFit.cover,
                     ),
          ), 
    child: Center(
      child:ListView(
        children: [
          CategorySection(title: 'Lanches', items: lanches, cart: cart),
          CategorySection(title: 'Bebidas', items: bebidas, cart: cart),
          CategorySection(title: 'Acompanhamentos', items: acompanhamentos, cart: cart),
        ],
      ),
    ),
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
                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(155, 65),
                                    backgroundColor:
                                         const Color.fromARGB(255, 240, 213, 132),
                                    
                                  ),
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
                    ImageNetwork(
                            
                               image: menuItem.imagem,
                               height: 80,
                               width: 80,
                               curve: Curves.easeIn,
                               borderRadius: BorderRadius.circular(20),
                               fitWeb: BoxFitWeb.cover,
                               onLoading: const CircularProgressIndicator(
                                 color: Colors.indigoAccent,
                               ),
                               onError: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                               ),
                             ),
                    SizedBox(width: 10),
                    Expanded(
                      
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                          
                          Text(
                            menuItem.name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(height: 4),
                          Text('R\$ ${menuItem.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.black),),
                          
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
                backgroundColor: const Color.fromARGB(255, 96, 28, 16),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('lib/images/cor.jpeg'), // Imagem de fundo
                       fit: BoxFit.cover,
                     ),
          ), 
    child: Center(
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                         menuItem.imagem,
                         height: 200, 
                         width: 250,),
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
      //backgroundColor: const Color.fromARGB(255, 147, 240, 150),
      body: Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('lib/images/Cor_fundo.jpg'), // Imagem de fundo
                       fit: BoxFit.cover,
                     ),
          ), 
    child: Center(
      child:Padding(
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
    ),
    ),
    );
  }
}