// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables, use_key_in_widget_constructors



import 'package:app_projeto_cardapio/model/carrinho.dart';
import 'package:app_projeto_cardapio/service/cardapio_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../controller/pedidos_controller.dart';

class CarrinhoView extends StatefulWidget {
  final Cart cart;

  CarrinhoView({required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CarrinhoView> {
  // Função para enviar pedido
  Future<void> _placeOrder() async {
    try {
      // Recuperar o uid do usuário autenticado
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Você precisa estar logado para fazer um pedido!')),
        );
        return;
      }

      // Mapear os itens do carrinho para o formato esperado pela função `criarPedido`
      final itensCarrinho = widget.cart.items.map((item) {
        return ItemCarrinho(
          itemId: item.name, 
          preco: item.price, 
          quantidade: item.quantidade,
        );
      }).toList();

      // Enviar dados para o Firestore
      await criarPedido(uid: uid, itens: itensCarrinho);

      setState(() {
        widget.cart.clear(); // Limpa o carrinho após enviar o pedido
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pedido realizado com sucesso!')),
      );

      Navigator.pop(context);
    } catch (e) {
      print("Erro ao enviar pedido: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar o pedido. Tente novamente.')),
      );
    }
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
          image: AssetImage('lib/images/cor.jpeg'),
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
                  color: Colors.white,
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
                        color: Colors.white.withOpacity(0.9),
                        child: ListTile(
                          leading: Image.network(
                            item.imagem,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            item.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'R\$ ${item.price.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.black54),
                          ),
                        
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    widget.cart.removeItem(item);
                                  });
                                },
                              ),
                              Text(
                                '${item.quantidade}',
                                style: TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    widget.cart.addItem(item);
                                  });
                                },
                              ),
                            ],
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: const Color.fromARGB(255, 96, 28, 16),
                        ),
                        onPressed: 
                            widget.cart.items.isNotEmpty 
                                ? _placeOrder 
                                : null,
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