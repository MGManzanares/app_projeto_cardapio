// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:flutter/material.dart';

class CarrinhoView extends StatefulWidget {
  final Cart cart;

  CarrinhoView({required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CarrinhoView> {
  void _placeOrder() {
    setState(() {
      widget.cart.clear(); // Limpa o carrinho após fazer o pedido
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pedido realizado com sucesso!')),
    );

    Navigator.pop(context); // Volta para a tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras', style: TextStyle(color: Colors.white)),
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
        child: widget.cart.items.isEmpty
            ? Center(
                child: Text(
                  'Seu carrinho está vazio!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Contraste para o fundo
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cart.items.length,
                      itemBuilder: (context, index) {
                        final item = widget.cart.items[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          color: Colors.white.withOpacity(0.9), // Fundo levemente transparente
                          child: ListTile(
                            title: Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'R\$ ${item.price.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.black54),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle,
                                  color: const Color.fromARGB(255, 96, 28, 16)),
                              onPressed: () {
                                setState(() {
                                  widget.cart.removeItem(item);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${item.name} removido!'),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Total: R\$ ${widget.cart.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Contraste para o fundo
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor:
                                const Color.fromARGB(255, 96, 28, 16),
                          ),
                          onPressed:
                              widget.cart.items.isNotEmpty ? _placeOrder : null,
                          child: Text('Fazer Pedido', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
